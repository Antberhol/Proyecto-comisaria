/* ==========================================================================
   BLOQUE 1: GESTIÓN INTERNA Y ADMINISTRACIÓN
   ========================================================================== */

-- 1. EVALUACIÓN DE RIESGO DE ZONA
-- Calcula si una zona es peligrosa (Riesgo ALTO) si tiene más de 10 avisos registrados.
DELIMITER //
CREATE OR REPLACE PROCEDURE p_evaluar_riesgo_zona (
    IN p_id_zona INT,
    OUT p_nivel_riesgo VARCHAR(20)
)
BEGIN
    DECLARE v_cantidad_avisos INT;

    SELECT COUNT(*) INTO v_cantidad_avisos
    FROM Aviso
    WHERE id_zona = p_id_zona;

    IF v_cantidad_avisos > 10 THEN
        SET p_nivel_riesgo = 'ALTO';
    ELSE
        SET p_nivel_riesgo = 'BAJO';
    END IF;
END //
DELIMITER ;

-- 2. ASCENSO AUTOMÁTICO POR ANTIGÜEDAD
-- Si un agente lleva 10 años o más en el cuerpo, lo asciende automáticamente a Oficial.
DELIMITER //
CREATE OR REPLACE PROCEDURE p_ascenso_automatico (
    IN p_id_usuario INT
)
BEGIN
    DECLARE v_fecha_ingreso DATE;
    DECLARE v_rango_actual VARCHAR(30);
    DECLARE v_antiguedad INT;

    SELECT fechaIngreso, rango INTO v_fecha_ingreso, v_rango_actual
    FROM Policia
    WHERE id_usuario = p_id_usuario;

    SET v_antiguedad = TIMESTAMPDIFF(YEAR, v_fecha_ingreso, CURDATE());

    IF (v_rango_actual = 'AGENTE' AND v_antiguedad >= 10) THEN
        UPDATE Policia 
        SET rango = 'OFICIAL' 
        WHERE id_usuario = p_id_usuario;
    END IF;
END //
DELIMITER ;

-- 3. ASIGNACIÓN SEGURA DE ARMAS
-- Asigna un arma a un policía solo si el arma es legal y está operativa.
DELIMITER //
CREATE OR REPLACE PROCEDURE p_asignar_arma_a_policia (
    IN p_id_arma INT,
    IN p_id_propietario INT
)
BEGIN
    DECLARE v_condicion VARCHAR(20);
    DECLARE v_origen VARCHAR(20);

    SELECT condicion, origen INTO v_condicion, v_origen
    FROM Arma
    WHERE id_arma = p_id_arma;

    IF (v_condicion = 'OPERATIVA' AND v_origen = 'LEGAL') THEN
        UPDATE Arma
        SET id_propietario = p_id_propietario
        WHERE id_arma = p_id_arma;
    ELSE
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Error: El arma no es apta para el servicio policial.';
    END IF;
END //
DELIMITER ;

-- 4. JUBILACIÓN DE VEHÍCULOS ANTIGUOS
-- Si un vehículo tiene más de 20 años, se le retira el seguro y se desvincula de su unidad.
DELIMITER //
CREATE OR REPLACE PROCEDURE p_jubilar_vehiculo (
    IN p_matricula VARCHAR(15)
)
BEGIN
    DECLARE v_anio_fabricacion INT;
    DECLARE v_edad INT;

    SELECT anioFabricacion INTO v_anio_fabricacion
    FROM Vehiculo
    WHERE matricula = p_matricula;

    SET v_edad = YEAR(CURDATE()) - v_anio_fabricacion;

    IF (v_edad > 20) THEN
        UPDATE Vehiculo
        SET estaAsegurado = 0, 
            id_unidad = NULL 
        WHERE matricula = p_matricula;
    END IF;
END //
DELIMITER ;

-- 5. ACTUALIZACIÓN DE SENTENCIAS JUDICIALES
-- Modifica la situación procesal de un delincuente (Condenado/Absuelto) tras un juicio.
-- Si es condenado, suma la pena; si es absuelto, la resetea.
DELIMITER //
CREATE OR REPLACE PROCEDURE p_actualizar_sentencia (
    IN p_id_persona INT,
    IN p_nuevo_estado VARCHAR(30),
    IN p_dias_condena_extra INT
)
BEGIN
    IF (p_nuevo_estado = 'CONDENADO') THEN
        UPDATE Delincuente
        SET situacionProcesal = 'CONDENADO',
            condenaDias = condenaDias + p_dias_condena_extra
        WHERE id_persona = p_id_persona;
    
    ELSEIF (p_nuevo_estado = 'ABSUELTO') THEN
        UPDATE Delincuente
        SET situacionProcesal = 'ABSUELTO',
            condenaDias = 0
        WHERE id_persona = p_id_persona;
    END IF;
END //
DELIMITER ;

-- 6. REASIGNACIÓN DE UNIDAD OPERATIVA
-- Mueve a un policía de unidad, verificando previamente que la unidad de destino existe.
-- Evita errores de integridad referencial al asignar destinos falsos.
DELIMITER //
CREATE OR REPLACE PROCEDURE p_reasignar_unidad_operativa (
    IN p_id_policia INT,
    IN p_id_nueva_unidad INT
)
BEGIN
    DECLARE v_existe_unidad INT;

    SELECT COUNT(*) INTO v_existe_unidad
    FROM Unidad
    WHERE id_unidad = p_id_nueva_unidad;

    IF (v_existe_unidad > 0) THEN
        UPDATE Policia
        SET id_unidad = p_id_nueva_unidad
        WHERE id_usuario = p_id_policia;
    ELSE
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Error: La unidad especificada no existe.';
    END IF;
END //
DELIMITER ;

/* ==========================================================================
   BLOQUE 2: OPERATIVA POLICIAL (Uso diario en la calle)
   ========================================================================== */

-- 7. CONTROL DE TRÁFICO (MATRÍCULA)
-- Permite al agente verificar en tiempo real si un vehículo es robado, no tiene seguro o es legal.
-- Devuelve un mensaje de texto directo para la toma de decisiones rápida.
DELIMITER //
CREATE OR REPLACE PROCEDURE p_control_trafico_matricula (
    IN p_matricula VARCHAR(15),
    OUT p_alerta VARCHAR(100)
)
BEGIN
    DECLARE v_id_vehiculo INT;
    DECLARE v_es_robado BOOLEAN;
    DECLARE v_tiene_seguro BOOLEAN;
    DECLARE v_nombre_propietario VARCHAR(50);

    SELECT V.id_vehiculo, V.robado, V.estaAsegurado, P.nombre
    INTO v_id_vehiculo, v_es_robado, v_tiene_seguro, v_nombre_propietario
    FROM Vehiculo V
    LEFT JOIN Persona P ON V.id_propietario = P.id_persona
    WHERE V.matricula = p_matricula;

    IF v_id_vehiculo IS NULL THEN
        SET p_alerta = 'NO EXISTE: Vehículo no registrado.';
    ELSEIF v_es_robado = 1 THEN
        SET p_alerta = 'ALERTA MÁXIMA: VEHÍCULO ROBADO.';
    ELSEIF v_tiene_seguro = 0 THEN
        SET p_alerta = CONCAT('INFRACCIÓN: Sin seguro. Dueño: ', COALESCE(v_nombre_propietario, 'Vehículo oficial'));
    ELSE
        SET p_alerta = CONCAT('OK: Todo correcto. Dueño: ', COALESCE(v_nombre_propietario, 'Vehículo oficial'));
    END IF;
END //
DELIMITER ;

-- 8. ANÁLISIS DE PELIGROSIDAD DE SUJETO
-- Evalúa a un sospechoso por su DNI contando sus delitos y armas.
-- Etiqueta al sujeto como 'Alta', 'Media' o 'Baja' peligrosidad en su ficha.
DELIMITER //
CREATE OR REPLACE PROCEDURE p_analisis_peligrosidad_sujeto (
    IN p_dni VARCHAR(15),
    OUT p_resultado VARCHAR(50)
)
BEGIN
    DECLARE v_id_persona INT;
    DECLARE v_cantidad_delitos INT DEFAULT 0;
    DECLARE v_cantidad_armas INT DEFAULT 0;
    DECLARE v_etiqueta VARCHAR(50);

    SELECT id_persona INTO v_id_persona 
    FROM Persona WHERE dni = p_dni;

    IF v_id_persona IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: DNI no encontrado.';
    ELSE
        SELECT COUNT(*) INTO v_cantidad_delitos
        FROM Rel_Persona_Delito
        WHERE id_persona = v_id_persona AND rol = 'culpable';

        SELECT COUNT(*) INTO v_cantidad_armas
        FROM Arma
        WHERE id_propietario = v_id_persona;

        IF (v_cantidad_delitos > 5 AND v_cantidad_armas > 0) THEN
            SET v_etiqueta = 'ALTA: ARMADO Y PELIGROSO';
        ELSEIF (v_cantidad_delitos > 2) THEN
            SET v_etiqueta = 'MEDIA: REINCIDENTE';
        ELSE
            SET v_etiqueta = 'BAJA: DELINCUENTE COMUN';
        END IF;

        UPDATE Delincuente SET alias = CONCAT(alias, ' [', v_etiqueta, ']')
        WHERE id_persona = v_id_persona;

        SET p_resultado = v_etiqueta;
    END IF;
END //
DELIMITER ;

-- 9. REGISTRO DE EVIDENCIAS EN ESCENA
-- Permite registrar pruebas de un delito, pero bloquea la acción si el caso ya está cerrado.
-- Asegura la cadena de custodia y la integridad del expediente.
DELIMITER //
CREATE OR REPLACE PROCEDURE p_registrar_evidencia_escena (
    IN p_id_delito INT,
    IN p_tipo VARCHAR(30),
    IN p_descripcion TEXT,
    IN p_lugar_hallazgo VARCHAR(100)
)
BEGIN
    DECLARE v_estado_delito VARCHAR(20);

    SELECT estadoProcesal INTO v_estado_delito
    FROM Delito
    WHERE id_delito = p_id_delito;

    IF v_estado_delito IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: El delito no existe.';
    ELSEIF v_estado_delito IN ('RESUELTO', 'ARCHIVADO') THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: Caso cerrado. No se admiten pruebas.';
    ELSE
        INSERT INTO Evidencia (tipo, descripcion, estado, lugar, id_delito)
        VALUES (p_tipo, p_descripcion, 'REGISTRADA', p_lugar_hallazgo, p_id_delito);
    END IF;
END //
DELIMITER ;

-- 10. REPORTAR SOSPECHOSO
-- Vincula a una persona (por DNI) a un delito como sospechoso.
-- Verifica primero que no esté ya vinculada para evitar duplicados.
DELIMITER //
CREATE OR REPLACE PROCEDURE p_reportar_sospechoso (
    IN p_dni_sospechoso VARCHAR(15),
    IN p_id_delito INT
)
BEGIN
    DECLARE v_id_persona INT;
    DECLARE v_ya_vinculado INT;

    SELECT id_persona INTO v_id_persona
    FROM Persona WHERE dni = p_dni_sospechoso;

    IF v_id_persona IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: Persona no registrada.';
    END IF;

    SELECT COUNT(*) INTO v_ya_vinculado
    FROM Rel_Persona_Delito
    WHERE id_persona = v_id_persona AND id_delito = p_id_delito;

    IF v_ya_vinculado = 0 THEN
        INSERT INTO Rel_Persona_Delito (id_persona, id_delito, rol)
        VALUES (v_id_persona, p_id_delito, 'sospechoso');
    ELSE
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Aviso: Persona ya vinculada al caso.';
    END IF;
END //
DELIMITER ;

-- 11. CIERRE DE TURNO (REPORTING)
-- Genera un resumen de actividad de la unidad para el cierre de turno.
-- Cuenta el total de avisos y cuántos fueron de alta gravedad hoy.
DELIMITER //
CREATE OR REPLACE PROCEDURE p_cierre_turno_patrulla (
    IN p_id_unidad INT,
    OUT p_resumen VARCHAR(200)
)
BEGIN
    DECLARE v_total_avisos INT;
    DECLARE v_gravedad_alta INT;
    DECLARE v_indicativo VARCHAR(50);

    SELECT indicativo INTO v_indicativo FROM Unidad WHERE id_unidad = p_id_unidad;

    SELECT COUNT(*) INTO v_total_avisos
    FROM Aviso
    WHERE id_unidad = p_id_unidad AND DATE(fecha) = CURDATE();

    SELECT COUNT(*) INTO v_gravedad_alta
    FROM Aviso
    WHERE id_unidad = p_id_unidad 
      AND DATE(fecha) = CURDATE()
      AND grado IN ('ROJO', 'NEGRO');

    IF v_indicativo IS NOT NULL THEN
        SET p_resumen = CONCAT('Unidad ', v_indicativo, ': ', v_total_avisos, 
                               ' avisos hoy. Graves: ', v_gravedad_alta);
    ELSE
        SET p_resumen = 'Error: Unidad desconocida.';
    END IF;
END //
DELIMITER ;

-- Revisado Final --