-- 1. BORRADO DE TABLAS (Desactivando FK temporalmente para evitar errores)
SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS Rel_Policia_Delito;
DROP TABLE IF EXISTS Rel_Vehiculo_Delito;
DROP TABLE IF EXISTS Rel_Persona_Delito;
DROP TABLE IF EXISTS Rel_Familiar;
DROP TABLE IF EXISTS Multimedia;
DROP TABLE IF EXISTS Evidencia;
DROP TABLE IF EXISTS Arma;
DROP TABLE IF EXISTS Datos;
DROP TABLE IF EXISTS Licencia;
DROP TABLE IF EXISTS Vehiculo;
DROP TABLE IF EXISTS Delito;
DROP TABLE IF EXISTS Aviso;
DROP TABLE IF EXISTS Unidad;
DROP TABLE IF EXISTS Zona;
DROP TABLE IF EXISTS Delincuente;
DROP TABLE IF EXISTS Persona;
DROP TABLE IF EXISTS Policia;
DROP TABLE IF EXISTS Administrador;
DROP TABLE IF EXISTS Usuario;

SET FOREIGN_KEY_CHECKS = 1;

/* =====================================================
   2. CREACIÓN DE TABLAS
   ===================================================== */

-- 2.1. USUARIOS Y JERARQUÍA
CREATE TABLE Usuario (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(100) NOT NULL UNIQUE,
    contrasena VARCHAR(255) NOT NULL CHECK (CHAR_LENGTH(contrasena) >=8),
    nombreUsuario VARCHAR(50) NOT NULL
);


CREATE TABLE Administrador (
    id_usuario INT PRIMARY KEY,
    CONSTRAINT fk_admin_user FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario) ON DELETE CASCADE
);

-- Creamos la tabla Unidad
CREATE TABLE Unidad (
    id_unidad INT AUTO_INCREMENT PRIMARY KEY,
    indicativo VARCHAR(50) NOT NULL UNIQUE,
    tipoUnidad ENUM('PATRULLA', 'UNIDAD_ESPECIAL', 'NARCOTICOS', 'ANTIDISTURBIOS', 'RECONOCIMIENTO', 'CANINA', 'RESCATE') NOT NULL,
    frecuenciaRadio VARCHAR(20),
    id_policia_supervisa INT
);

CREATE TABLE Policia (
	 id_policia INT AUTO_INCREMENT PRIMARY KEY,	
    id_usuario INT,
    numeroPlaca VARCHAR(20) NOT NULL UNIQUE,
    rango ENUM('AGENTE', 'OFICIAL', 'SUBINSPECTOR', 'INSPECTOR', 'INSPECTOR_JEFE', 'COMISARIO', 'COMISARIO_PRINCIPAL') NOT NULL,
    fechaIngreso DATE,
    id_unidad INT,
    CONSTRAINT fk_policia_user 
        FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario),
    CONSTRAINT fk_policia_unidad
        FOREIGN KEY (id_unidad) REFERENCES Unidad(id_unidad)
);

ALTER TABLE Unidad ADD CONSTRAINT fk_unidad_supervisor FOREIGN KEY (id_policia_supervisa) REFERENCES Policia(id_usuario);


CREATE TABLE Zona (
    id_zona INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    id_unidad INT,
    CONSTRAINT fk_zona_unidad FOREIGN KEY(id_unidad) REFERENCES Unidad(id_unidad)
);

-- 2.2. PERSONAS Y DELINCUENTES
CREATE TABLE Persona (
    id_persona INT AUTO_INCREMENT PRIMARY KEY,
	 dni VARCHAR(15) UNIQUE NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    apellido1 VARCHAR(50) NOT NULL,
    apellido2 VARCHAR(50),
    direccionLinea1 VARCHAR(100),
    direccionLinea2 VARCHAR(100),
    situacionLaboral VARCHAR(30),
    fechaNacimiento DATE,
    estadoCivil VARCHAR(20),
    estadoPersona VARCHAR(20),
    descripcion TEXT,
    CONSTRAINT ck_sit_laboral CHECK (situacionLaboral IN ('EMPLEADO', 'DESEMPLEADO', 'AUTONOMO', 'JUBILADO', 'ESTUDIANTE')),
    CONSTRAINT ck_est_civil CHECK (estadoCivil IN ('SOLTERO', 'CASADO', 'DIVORCIADO', 'VIUDO', 'UNION_DE_HECHO')),
    CONSTRAINT ck_est_persona CHECK (estadoPersona IN ('ACTIVA', 'INACTIVA', 'FALLECIDA', 'DESAPARECIDA', 'NO_IDENTIFICADA'))
);

CREATE TABLE Delincuente (
    id_persona INT PRIMARY KEY,
    condenaDias INT,
    situacionProcesal ENUM('INVESTIGACION', 'IMPUTADO', 'CONDENADO', 'ABSUELTO'),
    alias VARCHAR(50),
    CONSTRAINT fk_delincuente_persona FOREIGN KEY (id_persona) REFERENCES Persona(id_persona) ON DELETE CASCADE
);

-- 2.3. AVISOS Y DELITOS
CREATE TABLE Aviso (
    id_aviso INT AUTO_INCREMENT PRIMARY KEY,
    tipoAviso ENUM('DOCUMENTO', 'ALARMA', 'ALARMA_SILENCIOSA', 'LLAMADA', 'LLAMADA_EMERGENCIA', 'OPERACION') NOT NULL,
    codigoAviso INT,
    fecha DATETIME DEFAULT CURRENT_TIMESTAMP,
    direccion VARCHAR(200),
    grado VARCHAR(20),
    transcripcionLlamada TEXT,
    id_zona INT,
    id_unidad INT,
    id_emisor INT NOT NULL,
    CONSTRAINT fk_aviso_zona FOREIGN KEY (id_zona) REFERENCES Zona(id_zona),
    CONSTRAINT fk_aviso_unidad FOREIGN KEY (id_unidad) REFERENCES Unidad(id_unidad),
    CONSTRAINT fk_aviso_emisor FOREIGN KEY (id_emisor) REFERENCES Persona(id_persona)
);

CREATE TABLE Delito (
    id_delito INT AUTO_INCREMENT PRIMARY KEY,
    codigoTipificacion INT,
    descripcion TEXT,
    fecha DATETIME,
    estadoProcesal ENUM('INICIADO', 'EN_INVESTIGACION', 'RESUELTO', 'ARCHIVADO', 'PENDIENTE'),
    id_aviso INT,
    CONSTRAINT fk_delito_aviso FOREIGN KEY (id_aviso) REFERENCES Aviso(id_aviso)
);

-- 2.4. RECURSOS
CREATE TABLE Vehiculo (
    id_vehiculo INT AUTO_INCREMENT PRIMARY KEY,
    matricula VARCHAR(15) NOT NULL UNIQUE,
    tipo VARCHAR(20),
    modelo VARCHAR(50),
    color VARCHAR(30),
    estaAsegurado BOOLEAN DEFAULT FALSE,
    anioFabricacion INT,
    robado BOOLEAN DEFAULT FALSE,
    id_unidad INT,
    id_propietario INT,
    CONSTRAINT ck_tipo_vehiculo CHECK (tipo IN ('COCHE', 'MOTO', 'FURGONETA', 'CAMION', 'AUTOBUS', 'CICLOMOTOR')),
    CONSTRAINT fk_vehiculo_unidad FOREIGN KEY (id_unidad) REFERENCES Unidad(id_unidad),
    CONSTRAINT fk_vehiculo_prop FOREIGN KEY (id_propietario) REFERENCES Persona(id_persona)
);

CREATE TABLE Licencia (
    id_licencia INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE Datos (
	 id_datos INT AUTO_INCREMENT PRIMARY KEY,
    id_persona INT NOT NULL,
    fechaEmision DATE NOT NULL,
    fechaValidez DATE NOT NULL,
    id_licencia INT NOT NULL,
    CONSTRAINT fk_datos_licencia FOREIGN KEY (id_licencia) REFERENCES Licencia(id_licencia),
    CONSTRAINT fk_datos_persona FOREIGN KEY (id_persona) REFERENCES Persona(id_persona)
);

CREATE TABLE Arma (
    id_arma INT AUTO_INCREMENT PRIMARY KEY,
    numeroSerie VARCHAR(50) NOT NULL UNIQUE,
    tipo VARCHAR(30),
    modelo VARCHAR(50),
    condicion VARCHAR(20),
    origen VARCHAR(20),
    id_propietario INT,
    id_datos INT,
    CONSTRAINT ck_tipo_arma CHECK (tipo IN ('ARMA_BLANCA', 'ARMA_CONTUNDENTE', 'ARMA_DE_FUEGO_CORTA', 'ARMA_DE_FUEGO_LARGA', 'SUBFUSIL', 'AMETRALLADORA', 'EXPLOSIVO', 'ARMA_CASERA')),
    CONSTRAINT ck_condicion_arma CHECK (condicion IN ('NUEVA', 'BUEN_ESTADO', 'OPERATIVA', 'DETERIORADA', 'DEFECTUOSA', 'INUTILIZADA')),
    CONSTRAINT ck_origen_arma CHECK (origen IN ('LEGAL', 'ILEGAL', 'DECOMISADA', 'PERDIDA', 'ROBADA')),
    CONSTRAINT fk_arma_prop FOREIGN KEY (id_propietario) REFERENCES Persona(id_persona),
    CONSTRAINT fk_arma_datos FOREIGN KEY (id_datos) REFERENCES Datos(id_datos)
);

-- 2.5. EVIDENCIAS Y MULTIMEDIA
CREATE TABLE Evidencia (
    id_evidencia INT AUTO_INCREMENT PRIMARY KEY,
    tipo VARCHAR(30),
    descripcion TEXT,
    estado VARCHAR(20),
    lugar VARCHAR(100),
    id_delito INT NOT NULL,
    id_arma INT,
    CONSTRAINT ck_tipo_evidencia CHECK (tipo IN ('BIOLOGICA', 'DIGITAL', 'FISICA', 'DOCUMENTAL', 'TESTIMONIAL', 'OTRO')),
    CONSTRAINT ck_estado_evidencia CHECK (estado IN ('REGISTRADA', 'EN_CUSTODIA', 'EN_ANALISIS', 'ANALIZADA', 'DESCARTADA', 'ARCHIVADA', 'TRANSFERIDA')),
    CONSTRAINT fk_evidencia_delito FOREIGN KEY (id_delito) REFERENCES Delito(id_delito),
    CONSTRAINT fk_evidencia_arma FOREIGN KEY (id_arma) REFERENCES Arma(id_arma)
);

CREATE TABLE Multimedia (
    id_multimedia INT AUTO_INCREMENT PRIMARY KEY,
    extension VARCHAR(10),
    url VARCHAR(255),
    descripcion VARCHAR(255),
    id_persona_foto INT,
    id_persona_huella INT,
    id_aviso INT,
    id_evidencia INT,
    CONSTRAINT fk_multi_foto FOREIGN KEY (id_persona_foto) REFERENCES Persona(id_persona),
    CONSTRAINT fk_multi_huella FOREIGN KEY (id_persona_huella) REFERENCES Persona(id_persona),
    CONSTRAINT fk_multi_aviso FOREIGN KEY (id_aviso) REFERENCES Aviso(id_aviso),
    CONSTRAINT fk_multi_evidencia FOREIGN KEY (id_evidencia) REFERENCES Evidencia(id_evidencia)
);

-- 2.6. TABLAS INTERMEDIAS (RELACIONES N:M)


CREATE TABLE Rel_Persona_Delito (
    id_persona INT,
    id_delito INT,
    rol ENUM('VICTIMA', 'CULPABLE', 'TESTIGO', 'SOSPECHOSO'),
    PRIMARY KEY (id_persona, id_delito),
    CONSTRAINT fk_rel_pd_persona FOREIGN KEY (id_persona) REFERENCES Persona(id_persona),
    CONSTRAINT fk_rel_pd_delito FOREIGN KEY (id_delito) REFERENCES Delito(id_delito)
);

CREATE TABLE Rel_Vehiculo_Delito (
    id_vehiculo INT,
    id_delito INT,
    PRIMARY KEY (id_vehiculo, id_delito),
    CONSTRAINT fk_rel_vd_vehiculo FOREIGN KEY (id_vehiculo) REFERENCES Vehiculo(id_vehiculo),
    CONSTRAINT fk_rel_vd_delito FOREIGN KEY (id_delito) REFERENCES Delito(id_delito)
);

CREATE TABLE Rel_Policia_Delito (
    id_policia INT,
    id_delito INT,
    PRIMARY KEY (id_policia, id_delito),
    CONSTRAINT fk_rel_pod_policia FOREIGN KEY (id_policia) REFERENCES Policia(id_usuario),
    CONSTRAINT fk_rel_pod_delito FOREIGN KEY (id_delito) REFERENCES Delito(id_delito)
);

CREATE TABLE Rel_Familiar (
    id_persona INT,
    id_familiar INT,
    PRIMARY KEY (id_persona, id_familiar),
    tipo_parentesco ENUM(
        'PROGENITOR',
        'ABUELO',
        'BISABUELO',
        'TATARABUELO',
        'HIJO',
        'NIETO',
        'BISNIETO',
        'TATARANIETO',
        'HERMANO',
        'MEDIO_HERMANO',
        'TIO',
        'PRIMO',
        'SOBRINO',
        'TIO_ABUELO',
        'PRIMO_SEGUNDO',
        'CONYUGE',
        'EXCONYUGE',
        'PAREJA_HECHO',
        'SUEGRO',
        'YERNO_NUERA',
        'CUNADO',
        'CONCUNADO',
        'PADRASTRO_MADRASTRA',
        'HIJASTRO',
        'HERMANASTRO',
        'ABUELASTRO',
        'TUTOR_LEGAL',
        'ADOPTANTE',
        'ADOPTADO',
        'ACOGEDOR',
        'ACOGIDO',
        'PADRINO_MADRINA'
    ) NOT NULL,
    CONSTRAINT fk_rel_fam_1 FOREIGN KEY (id_persona) REFERENCES Persona(id_persona),
    CONSTRAINT fk_rel_fam_2 FOREIGN KEY (id_familiar) REFERENCES Persona(id_persona)
);

-- Revisado Final --