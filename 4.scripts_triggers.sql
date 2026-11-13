-- Organización por Reglas de Negocio (RN)
-- Cada trigger implementa una RN específica del documento de requisitos

-- RN.03 - Requisitos mínimos de las unidades
-- Validación: Supervisor debe tener rango COMISARIO o superior

DELIMITER //

CREATE OR REPLACE TRIGGER trg_check_rango_supervisor_unidad
BEFORE INSERT ON Unidad
FOR EACH ROW
BEGIN
    DECLARE v_rango_policia VARCHAR(30);

    IF NEW.id_policia_supervisa IS NOT NULL THEN
        
        SELECT rango INTO v_rango_policia
        FROM Policia
        WHERE id_usuario = NEW.id_policia_supervisa;

        -- Validamos que sea COMISARIO o superior
        IF v_rango_policia NOT IN ('COMISARIO', 'COMISARIO_PRINCIPAL') THEN
            SIGNAL SQLSTATE '45000' 
            SET MESSAGE_TEXT = 'Error de Mando: Esta unidad requiere supervisión de un COMISARIO o superior.';
        END IF;
    END IF;
END //

DELIMITER ;


-- RN.03 - Requisitos mínimos de las unidades (Parte 2)
-- Validación: Una unidad debe tener al menos 2 agentes para ser asignada a un aviso

DELIMITER //

CREATE OR REPLACE TRIGGER trg_check_minimo_agentes_unidad
BEFORE UPDATE ON Aviso
FOR EACH ROW
BEGIN
    DECLARE v_num_agentes INT;

    -- Solo validar si se está asignando una unidad al aviso
    IF NEW.id_unidad IS NOT NULL AND (OLD.id_unidad IS NULL OR OLD.id_unidad != NEW.id_unidad) THEN
        SELECT COUNT(*) INTO v_num_agentes
        FROM Policia
        WHERE id_unidad = NEW.id_unidad;

        IF v_num_agentes < 2 THEN
            SIGNAL SQLSTATE '45000' 
            SET MESSAGE_TEXT = 'Error RN.03: La unidad debe tener al menos 2 agentes asignados para atender un aviso.';
        END IF;
    END IF;
END //

DELIMITER ;



-- RN.04 - Inmutabilidad de evidencias analizadas
-- Bloqueo: No se pueden modificar evidencias analizadas en casos cerrados

DELIMITER //

CREATE OR REPLACE TRIGGER trg_bloqueo_manipulacion_evidencia
BEFORE UPDATE ON Evidencia
FOR EACH ROW
BEGIN
    DECLARE v_estado_caso VARCHAR(30);

    SELECT estadoProcesal INTO v_estado_caso
    FROM Delito
    WHERE id_delito = OLD.id_delito;

    IF (v_estado_caso = 'RESUELTO' OR v_estado_caso = 'ARCHIVADO') 
       AND OLD.estado = 'ANALIZADA' THEN
       
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Error Forense: Violación de cadena de custodia. El caso está cerrado y la evidencia ya fue analizada.';
    END IF;
END //

DELIMITER ;



-- RN.05 - Prohibición de eliminación de registros
-- Bloqueo: Los delitos no pueden ser eliminados, solo archivados

DELIMITER //

CREATE OR REPLACE TRIGGER trg_impedir_borrado_delito
BEFORE DELETE ON Delito
FOR EACH ROW
BEGIN
    SIGNAL SQLSTATE '45000' 
    SET MESSAGE_TEXT = 'Acción Ilegal: Por la RN.05 (Trazabilidad), está prohibido borrar delitos. Use UPDATE para cambiar el estado a ARCHIVADO.';
END //

DELIMITER ;



-- RN.06 - Registro automático de vehículos robados
-- Automatización: Genera aviso y delito al marcar vehículo como robado

DELIMITER //

CREATE OR REPLACE TRIGGER trg_auto_aviso_robo_simple
AFTER UPDATE ON Vehiculo
FOR EACH ROW
BEGIN
    DECLARE v_id_aviso INT;

    IF OLD.robado = 0 AND NEW.robado = 1 THEN

        -- Insertar el aviso
        INSERT INTO Aviso (
            tipoAviso, 
            codigoAviso, 
            fecha, 
            direccion, 
            grado, 
            transcripcionLlamada, 
            id_zona,
            id_unidad,
            id_emisor
        ) VALUES (
            'ALARMA', 
            244, 
            NOW(), 
            NULL, 
            'NARANJA', 
            CONCAT('Alerta de robo: ', NEW.matricula),
            NULL,
            NULL,
            NEW.id_propietario
        );
        
        SET v_id_aviso = LAST_INSERT_ID();
        
        INSERT INTO Delito (codigoTipificacion, descripcion, fecha, estadoProcesal, id_aviso) 
        VALUES (244, CONCAT('Robo: ', NEW.matricula), NOW(), 'PENDIENTE', v_id_aviso);
        
        INSERT INTO Rel_Persona_Delito(id_persona, id_delito, rol) VALUES (NEW.id_propietario, LAST_INSERT_ID(), 'VICTIMA');
    END IF;
END //

DELIMITER ;



-- RN.07 - Condiciones para marcar delitos como resueltos
-- Validación: Todas las evidencias analizadas y sospechosos procesados

DELIMITER //

CREATE OR REPLACE TRIGGER trg_validar_resolucion_delito
BEFORE UPDATE ON Delito
FOR EACH ROW
BEGIN
    DECLARE v_evidencias_pendientes INT;
    DECLARE v_sospechosos_pendientes INT;

    IF NEW.estadoProcesal = 'RESUELTO' AND OLD.estadoProcesal != 'RESUELTO' THEN
        
        SELECT COUNT(*) INTO v_evidencias_pendientes
        FROM Evidencia
        WHERE id_delito = NEW.id_delito 
          AND estado NOT IN ('ANALIZADA', 'DESCARTADA');

        SELECT COUNT(*) INTO v_sospechosos_pendientes
        FROM Rel_Persona_Delito rpd
        JOIN Delincuente d ON rpd.id_persona = d.id_persona
        WHERE rpd.id_delito = NEW.id_delito
          AND rpd.rol IN ('CULPABLE', 'SOSPECHOSO')
          AND d.situacionProcesal = 'INVESTIGACION';

        IF v_evidencias_pendientes > 0 OR v_sospechosos_pendientes > 0 THEN
            SIGNAL SQLSTATE '45000' 
            SET MESSAGE_TEXT = 'Bloqueo Policial: No se puede cerrar el caso. Hay evidencias sin analizar o sospechosos sin procesar judicialmente.';
        END IF;
    END IF;
END //

DELIMITER ;



-- RN.08 - Asociación obligatoria de personas a delitos
-- Validación: Un delito no puede cambiar de estado INICIADO sin tener al menos una persona asociada

DELIMITER //

CREATE OR REPLACE TRIGGER trg_validar_persona_en_delito
BEFORE UPDATE ON Delito
FOR EACH ROW
BEGIN
    DECLARE v_personas_asociadas INT;

    -- Solo validar si el delito está cambiando de estado INICIADO a otro
    IF OLD.estadoProcesal = 'INICIADO' AND NEW.estadoProcesal != 'INICIADO' THEN
        
        SELECT COUNT(*) INTO v_personas_asociadas
        FROM Rel_Persona_Delito
        WHERE id_delito = NEW.id_delito;

        IF v_personas_asociadas = 0 THEN
            SIGNAL SQLSTATE '45000' 
            SET MESSAGE_TEXT = 'Error RN.08: El delito debe tener al menos una persona asociada (víctima o sospechoso) antes de avanzar de estado.';
        END IF;
    END IF;
END //

DELIMITER ;



-- RN.09 - Vinculación obligatoria de evidencias
-- Validación: Toda evidencia debe estar vinculada a un delito

DELIMITER //

CREATE OR REPLACE TRIGGER trg_validar_evidencia_con_delito
BEFORE INSERT ON Evidencia
FOR EACH ROW
BEGIN
    -- Validar que el delito asociado existe
    IF NEW.id_delito IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error RN.09: Toda evidencia debe estar vinculada obligatoriamente a un delito.';
    END IF;
    
    -- Validar que existe el delito referenciado
    IF NOT EXISTS (SELECT 1 FROM Delito WHERE id_delito = NEW.id_delito) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error RN.09: El delito asociado no existe en la base de datos.';
    END IF;
END //

DELIMITER ;

DELIMITER //

CREATE OR REPLACE TRIGGER trg_validar_datos_obligatorios_evidencia
BEFORE INSERT ON Evidencia
FOR EACH ROW
BEGIN
    -- Validar que tenga localización
    IF NEW.lugar IS NULL OR TRIM(NEW.lugar) = '' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error RN.09: La evidencia debe tener una localización registrada.';
    END IF;
    
    -- Validar que tenga descripción
    IF NEW.descripcion IS NULL OR TRIM(NEW.descripcion) = '' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error RN.09: La evidencia debe tener una descripción.';
    END IF;
    
    -- Validar que tenga tipo
    IF NEW.tipo IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error RN.09: La evidencia debe tener un tipo definido.';
    END IF;
END //

DELIMITER ;


-- =====================================================
-- VALIDACIONES ADICIONALES DE INTEGRIDAD
-- Triggers complementarios para garantizar calidad de datos
-- =====================================================

-- -----------------------------------------------------
-- VEHÍCULOS: Validación de formato de matrícula española
-- Formato: 4 dígitos + 3 consonantes o formato policial CNP
-- -----------------------------------------------------
DELIMITER //

CREATE OR REPLACE TRIGGER trg_validar_formato_matricula
BEFORE INSERT ON Vehiculo
FOR EACH ROW
BEGIN

    IF NOT (
        NEW.matricula REGEXP '^[0-9]{4}[ -]?[BCDFGHJKLMNPRSTVWXYZ]{3}$' 
        OR 
        NEW.matricula LIKE 'CNP-%'
    ) THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Formato Inválido: La matrícula debe ser 4 números y 3 letras consonantes (Ej: 1234-BBB) o formato policial (CNP-XXXX).';
    END IF;
END //

DELIMITER ;


-- -----------------------------------------------------
-- MULTIMEDIA: Exclusividad de asociación
-- Un archivo solo puede pertenecer a UNA entidad (Persona/Aviso/Evidencia)
-- -----------------------------------------------------
DELIMITER $$

CREATE OR REPLACE TRIGGER check_multimedia_exclusivity
BEFORE INSERT ON Multimedia
FOR EACH ROW
BEGIN
    DECLARE num_referencias INT;

    SET num_referencias = (NEW.id_persona_foto IS NOT NULL) 
                        + (NEW.id_persona_huella IS NOT NULL) 
                        + (NEW.id_aviso IS NOT NULL) 
                        + (NEW.id_evidencia IS NOT NULL);

    -- Validación 1: No pueden ser ambos (Aviso y Evidencia) a la vez, 
    -- o cualquier otra combinación. Debe ser EXACTAMENTE 1.
    IF num_referencias != 1 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: El archivo multimedia no puede pertenecer a más de una entidad (Aviso, Evidencia, Persona, etc.) a la vez.';
    END IF;

    -- Validación 2 (Opcional pero recomendada): Debe pertenecer a AL MENOS uno.
    IF num_referencias = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: El archivo multimedia debe estar asociado a una entidad.';
    END IF;
END$$

DELIMITER ;

-- Revisado Fin -- 