

SET FOREIGN_KEY_CHECKS = 0;

-- 1. LIMPIEZA
TRUNCATE TABLE Rel_Policia_Delito;
TRUNCATE TABLE Rel_Vehiculo_Delito;
TRUNCATE TABLE Rel_Persona_Delito;
TRUNCATE TABLE Rel_Familiar;
TRUNCATE TABLE Multimedia;
TRUNCATE TABLE Evidencia;
TRUNCATE TABLE Arma;
TRUNCATE TABLE Datos;
TRUNCATE TABLE Licencia;
TRUNCATE TABLE Vehiculo;
TRUNCATE TABLE Delito;
TRUNCATE TABLE Aviso;
TRUNCATE TABLE Unidad;
TRUNCATE TABLE Policia;
TRUNCATE TABLE Administrador;
TRUNCATE TABLE Usuario;
TRUNCATE TABLE Delincuente;
TRUNCATE TABLE Persona;
TRUNCATE TABLE Zona;

-- -----------------------------------------------------
-- 2. ZONAS (20 zonas)
-- -----------------------------------------------------


-- -----------------------------------------------------
-- 3. USUARIOS Y POLICÍAS (50 usuarios)
-- -----------------------------------------------------
INSERT INTO Usuario (id_usuario, email, contrasena, nombreUsuario) VALUES 
(1,'admin@policia.es', 'Admin2025', 'Admin'),
(2,'lorenzo.castro@policia.es', 'Policia2025', 'ComisarioLorenzo'),
(3,'paco.miranda@policia.es', 'Policia2025', 'InspMiranda'),
(4,'mariano.moreno@policia.es', 'Policia2025', 'AgenteMariano'),
(5,'lucas.fernandez@policia.es', 'Policia2025', 'SubInspLucas'),
(6,'silvia.castro@policia.es', 'Policia2025', 'OficialSilvia'),
(7,'pepa.miranda@policia.es', 'Policia2025', 'AgentePepa'),
(8,'curtis.naranjo@policia.es', 'Policia2025', 'AgenteCurtis'),
(9,'rita.pelaez@policia.es', 'Policia2025', 'AgenteRita'),
(10,'jose.povedilla@policia.es', 'Policia2025', 'AgentePovedilla'),
(11,'raquel.murillo@policia.es', 'Policia2025', 'InspMurillo'),
(12, 'angel.rubio@policia.es', 'Policia2025', 'SubInspAngel'),
(13, 'carmen.lopez@policia.es', 'Policia2025', 'AgenteCarmen'),
(14, 'david.martin@policia.es', 'Policia2025', 'AgenteDavid'),
(15, 'elena.santos@policia.es', 'Policia2025', 'AgenteElena'),
(16, 'fernando.ruiz@policia.es', 'Policia2025', 'AgenteFernando'),
(17, 'gloria.mendez@policia.es', 'Policia2025', 'AgenteGloria'),
(18, 'hugo.navarro@policia.es', 'Policia2025', 'AgenteHugo'),
(19, 'irene.blanco@policia.es', 'Policia2025', 'AgenteIrene'),
(20, 'javier.ortega@policia.es', 'Policia2025', 'AgenteJavier'),
(21, 'laura.vega@policia.es', 'Policia2025', 'SubInspLaura'),
(22, 'miguel.torres@policia.es', 'Policia2025', 'InspMiguel'),
(23, 'natalia.diaz@policia.es', 'Policia2025', 'AgenteNatalia'),
(24, 'oscar.herrera@policia.es', 'Policia2025', 'AgenteOscar'),
(25, 'patricia.mora@policia.es', 'Policia2025', 'AgentePatricia'),
(26, 'roberto.silva@policia.es', 'Policia2025', 'ComisarioRoberto'),
(27, 'sandra.ramos@policia.es', 'Policia2025', 'AgenteSandra'),
(28, 'tomas.iglesias@policia.es', 'Policia2025', 'AgenteTomas'),
(29, 'ursula.campos@policia.es', 'Policia2025', 'AgenteUrsula'),
(30, 'victor.prieto@policia.es', 'Policia2025', 'AgenteVictor'),
(31, 'wendy.soto@policia.es', 'Policia2025', 'AgenteWendy'),
(32, 'xavier.luna@policia.es', 'Policia2025', 'SubInspXavier'),
(33, 'yolanda.cruz@policia.es', 'Policia2025', 'AgenteYolanda'),
(34, 'zacarías.fuentes@policia.es', 'Policia2025', 'AgenteZacarias'),
(35, 'alba.serrano@policia.es', 'Policia2025', 'AgenteAlba'),
(36, 'bruno.medina@policia.es', 'Policia2025', 'AgenteBruno'),
(37, 'clara.jimenez@policia.es', 'Policia2025', 'AgenteClara'),
(38, 'daniel.vazquez@policia.es', 'Policia2025', 'AgenteDaniel'),
(39, 'eva.romero@policia.es', 'Policia2025', 'AgenteEva'),
(40, 'felix.castro@policia.es', 'Policia2025', 'InspFelix'),
(41, 'gema.alonso@policia.es', 'Policia2025', 'AgenteGema'),
(42, 'hector.molina@policia.es', 'Policia2025', 'AgenteHector'),
(43, 'ines.guerrero@policia.es', 'Policia2025', 'AgenteInes'),
(44, 'jorge.nieto@policia.es', 'Policia2025', 'AgenteJorge'),
(45, 'karen.dominguez@policia.es', 'Policia2025', 'AgenteKaren'),
(46, 'luis.vargas@policia.es', 'Policia2025', 'SubInspLuis'),
(47, 'maria.pena@policia.es', 'Policia2025', 'AgenteMaria'),
(48, 'nicolas.reyes@policia.es', 'Policia2025', 'AgenteNicolas'),
(49, 'olga.gil@policia.es', 'Policia2025', 'AgenteOlga'),
(50, 'pablo.marquez@policia.es', 'Policia2025', 'AgentePablo');

INSERT INTO Administrador (id_usuario) VALUES (1);

INSERT INTO Policia (id_usuario, numeroPlaca, rango, fechaIngreso, id_unidad) VALUES 
(2, 'CNP-001', 'COMISARIO_PRINCIPAL', '1980-01-01', NULL),
(3, 'CNP-PAC', 'INSPECTOR_JEFE', '1995-02-20', NULL),
(4, 'CNP-MAR', 'AGENTE', '1996-03-15', NULL),
(5, 'CNP-LUC', 'SUBINSPECTOR', '2000-06-10', NULL),
(6, 'CNP-SIL', 'INSPECTOR', '2002-09-01', NULL),
(7, 'CNP-PEP', 'AGENTE', '2005-05-05', NULL),
(8, 'CNP-CUR', 'AGENTE', '1998-11-11', NULL),
(9, 'CNP-RIT', 'AGENTE', '2003-04-04', NULL),
(10, 'CNP-POV', 'AGENTE', '2006-01-01', NULL),
(11, 'CNP-LIS', 'INSPECTOR', '2010-10-10', NULL),
(12, 'CNP-ANG', 'SUBINSPECTOR', '2010-10-10', NULL),
(13, 'CNP-CAR', 'AGENTE', '2015-03-15', NULL),
(14, 'CNP-DAV', 'AGENTE', '2016-06-20', NULL),
(15, 'CNP-ELE', 'AGENTE', '2017-09-10', NULL),
(16, 'CNP-FER', 'AGENTE', '2014-12-01', NULL),
(17, 'CNP-GLO', 'AGENTE', '2018-02-28', NULL),
(18, 'CNP-HUG', 'AGENTE', '2019-05-15', NULL),
(19, 'CNP-IRE', 'AGENTE', '2020-08-22', NULL),
(20, 'CNP-JAV', 'AGENTE', '2013-11-30', NULL),
(21, 'CNP-LAU', 'SUBINSPECTOR', '2008-04-18', NULL),
(22, 'CNP-MIG', 'INSPECTOR', '2005-07-25', NULL),
(23, 'CNP-NAT', 'AGENTE', '2021-01-10', NULL),
(24, 'CNP-OSC', 'AGENTE', '2019-03-05', NULL),
(25, 'CNP-PAT', 'AGENTE', '2020-06-12', NULL),
(26, 'CNP-ROB', 'COMISARIO', '1990-09-01', NULL),
(27, 'CNP-SAN', 'AGENTE', '2022-02-14', NULL),
(28, 'CNP-TOM', 'AGENTE', '2017-10-31', NULL),
(29, 'CNP-URS', 'AGENTE', '2018-12-25', NULL),
(30, 'CNP-VIC', 'AGENTE', '2016-04-08', NULL),
(31, 'CNP-WEN', 'AGENTE', '2021-07-19', NULL),
(32, 'CNP-XAV', 'SUBINSPECTOR', '2010-05-05', NULL),
(33, 'CNP-YOL', 'AGENTE', '2019-08-15', NULL),
(34, 'CNP-ZAC', 'AGENTE', '2020-11-22', NULL),
(35, 'CNP-ALB', 'AGENTE', '2022-03-30', NULL),
(36, 'CNP-BRU', 'AGENTE', '2018-06-17', NULL),
(37, 'CNP-CLA', 'AGENTE', '2019-09-28', NULL),
(38, 'CNP-DAN', 'AGENTE', '2017-12-12', NULL),
(39, 'CNP-EVA', 'AGENTE', '2020-02-29', NULL),
(40, 'CNP-FEL', 'INSPECTOR', '2003-08-08', NULL),
(41, 'CNP-GEM', 'AGENTE', '2021-04-04', NULL),
(42, 'CNP-HEC', 'AGENTE', '2018-07-21', NULL),
(43, 'CNP-INE', 'AGENTE', '2019-10-10', NULL),
(44, 'CNP-JOR', 'AGENTE', '2020-01-01', NULL),
(45, 'CNP-KAR', 'AGENTE', '2022-05-25', NULL),
(46, 'CNP-LUI', 'SUBINSPECTOR', '2012-03-17', NULL),
(47, 'CNP-MAR2', 'AGENTE', '2021-06-30', NULL),
(48, 'CNP-NIC', 'AGENTE', '2019-11-11', NULL),
(49, 'CNP-OLG', 'AGENTE', '2020-04-20', NULL),
(50, 'CNP-PAB', 'AGENTE', '2022-08-08', NULL);

-- -----------------------------------------------------
-- 4. UNIDADES (15 unidades)
-- -----------------------------------------------------
INSERT INTO Unidad (id_unidad, indicativo, tipoUnidad, frecuenciaRadio, id_policia_supervisa) VALUES 
(1, 'Z-SanAntonio', 'PATRULLA', '112.5', 2),          
(2, 'Cientifica-SA', 'RECONOCIMIENTO', '118.0', 2),   
(3, 'Operaciones-Esp', 'UNIDAD_ESPECIAL', '120.0', 2), 
(4, 'Negociacion', 'UNIDAD_ESPECIAL', '150.0', 2),
(5, 'Trafico-M30', 'PATRULLA', '115.5', 2),
(6, 'Narcoticos-Centro', 'NARCOTICOS', '125.0', 2),
(7, 'Antidisturbios-1', 'ANTIDISTURBIOS', '130.0', 26),
(8, 'Canina-Madrid', 'CANINA', '135.0', 26),
(9, 'Rescate-112', 'RESCATE', '140.0', 26),
(10, 'Patrulla-Salamanca', 'PATRULLA', '113.0', 2),
(11, 'Patrulla-Lavapies', 'PATRULLA', '113.5', 2),
(12, 'Patrulla-Vallecas', 'PATRULLA', '114.0', 26),
(13, 'Patrulla-Carabanchel', 'PATRULLA', '114.5', 26),
(14, 'Reconocimiento-Sur', 'RECONOCIMIENTO', '119.0', 2),
(15, 'Especial-Aeropuerto', 'UNIDAD_ESPECIAL', '155.0', 26);

UPDATE Policia SET id_unidad = 1 WHERE id_usuario IN (3, 4, 5, 10);
UPDATE Policia SET id_unidad = 2 WHERE id_usuario IN (6);            
UPDATE Policia SET id_unidad = 3 WHERE id_usuario IN (7, 8, 9);      
UPDATE Policia SET id_unidad = 4 WHERE id_usuario IN (11, 12);       
UPDATE Policia SET id_unidad = 5 WHERE id_usuario IN (13, 14); 
UPDATE Policia SET id_unidad = 1 WHERE id_usuario = 2;
UPDATE Policia SET id_unidad = 6 WHERE id_usuario IN (15, 16, 17);
UPDATE Policia SET id_unidad = 7 WHERE id_usuario IN (18, 19, 20, 21);
UPDATE Policia SET id_unidad = 8 WHERE id_usuario IN (22, 23, 24);
UPDATE Policia SET id_unidad = 9 WHERE id_usuario IN (25, 26, 27);
UPDATE Policia SET id_unidad = 10 WHERE id_usuario IN (28, 29, 30);
UPDATE Policia SET id_unidad = 11 WHERE id_usuario IN (31, 32, 33);
UPDATE Policia SET id_unidad = 12 WHERE id_usuario IN (34, 35, 36);
UPDATE Policia SET id_unidad = 13 WHERE id_usuario IN (37, 38, 39);
UPDATE Policia SET id_unidad = 14 WHERE id_usuario IN (40, 41, 42);
UPDATE Policia SET id_unidad = 15 WHERE id_usuario IN (43, 44, 45, 46, 47, 48, 49, 50);   


INSERT INTO Zona (id_zona, nombre, id_unidad) VALUES 
(1, 'Distrito Centro (San Antonio)', 1),
(2, 'Urbanización Montepinar', 12),
(3, 'Barrio de las Letras (Desengaño)', 13),
(4, 'Esperanza Sur', 10),
(5, 'Polígono Industrial Los Olivos', 11),
(6, 'Distrito Financiero (FNMT)', 12),
(7, 'Autopista M-30', 10),
(8, 'Barrio Salamanca', 1),
(9, 'Lavapiés', 11),
(10, 'Malasaña', 10),
(11, 'Chamberí', 11),
(12, 'Tetuán', 12),
(13, 'Vallecas', 13),
(14, 'Carabanchel', 13),
(15, 'Usera', 1),
(16, 'Villaverde', 12),
(17, 'Hortaleza', 11),
(18, 'Ciudad Lineal', 9),
(19, 'Moratalaz', 10),
(20, 'Vicálvaro', 11);            

-- -----------------------------------------------------
-- 5. PERSONAS 
-- -----------------------------------------------------
INSERT INTO Persona (id_persona, dni, nombre, apellido1, apellido2, direccionLinea1, direccionLinea2, situacionLaboral, fechaNacimiento, estadoCivil, estadoPersona, descripcion) VALUES 
-- LQSA
(20, '05432100A', 'Antonio', 'Recio', 'Matamoros', 'Ave del Paraiso 7', '1º C', 'AUTONOMO', '1970-04-20', 'CASADO', 'ACTIVA', 'Calvicie parcial, 1.70m'),
(21, '05432101B', 'Berta', 'Escobar', 'Indian', 'Ave del Paraiso 7', '1º C', 'EMPLEADO', '1974-05-05', 'CASADO', 'ACTIVA', 'Pelo rubio liso, tez palida'),
(22, '05432102C', 'Amador', 'Rivas', 'Latorre', 'Ave del Paraiso 7', 'Bajo A', 'DESEMPLEADO', '1975-10-10', 'DIVORCIADO', 'ACTIVA', 'Musculado, pelo rapado'),
(23, '05432103D', 'Enrique', 'Pastor', 'Julian', 'Ave del Paraiso 7', 'Bajo B', 'EMPLEADO', '1965-02-14', 'DIVORCIADO', 'ACTIVA', 'Pelo canoso, gafas pasta'),
(24, '05432104E', 'Jorge', 'Calatrava', 'Perez', 'Ave del Paraiso 7', 'Caravana', 'EMPLEADO', '1980-08-08', 'SOLTERO', 'ACTIVA', 'Pelo largo teñido'),

-- ANHQV
(30, '01234567J', 'Juan', 'Cuesta', 'Ruiz', 'Calle Desengaño 21', '2º A', 'EMPLEADO', '1960-05-20', 'CASADO', 'ACTIVA', 'Bigote poblado'),
(31, '01234568P', 'Paloma', 'Hurtado', 'Mejias', 'Calle Desengaño 21', '2º A', 'DESEMPLEADO', '1962-08-15', 'CASADO', 'INACTIVA', 'En coma'),
(32, '01234569E', 'Emilio', 'Delgado', 'Martin', 'Calle Desengaño 21', 'Porteria', 'EMPLEADO', '1975-12-12', 'SOLTERO', 'ACTIVA', 'Pelo rizado negro'),
(33, '01234570V', 'Vicenta', 'Benito', 'Valbuena', 'Calle Desengaño 21', '1º A', 'JUBILADO', '1945-01-01', 'SOLTERO', 'ACTIVA', 'Pelo corto gris, gafas'),
(34, '01234571M', 'Marisa', 'Benito', 'Valbuena', 'Calle Desengaño 21', '1º A', 'JUBILADO', '1940-02-02', 'VIUDO', 'ACTIVA', 'Fumadora compulsiva'),

-- AÍDA
(40, '09876543L', 'Luis', 'Garcia', 'Garcia', 'Calle de la Oca 4', 'Bajo Izq', 'DESEMPLEADO', '1975-01-01', 'SOLTERO', 'ACTIVA', 'Muy delgado, marcas de acne'),
(41, '09876544M', 'Mauricio', 'Colmenero', 'Sanchez', 'Avda Constitucion 12', 'Local Bar', 'AUTONOMO', '1960-11-11', 'SOLTERO', 'ACTIVA', 'Bigote, pelo engominado'),

-- LA CASA DE PAPEL
(50, '99999991P', 'Sergio', 'Marquina', 'Profesor', 'Camino Zarzuela 50', NULL, 'AUTONOMO', '1980-01-01', 'SOLTERO', 'ACTIVA', 'Gafas negras grandes'),
(51, '99999992T', 'Silene', 'Oliveira', 'Tokyo', 'Ctra Toledo km 30', NULL, 'DESEMPLEADO', '1990-01-01', 'SOLTERO', 'ACTIVA', 'Pelo corto, tatuaje cuello'),
(52, '99999993B', 'Andres', 'Fonollosa', 'Gonzalvez', 'Paseo Castellana 100', NULL, 'DESEMPLEADO', '1975-01-01', 'SOLTERO', 'FALLECIDA', 'Elegante'),

-- QUINQUIS / OTROS
(60, '12312312T', 'Jose Luis', 'Torrente', 'Lazaro', 'Calle del Pez 3', 'Bajo D', 'DESEMPLEADO', '1965-03-03', 'SOLTERO', 'ACTIVA', 'Obesidad morbida'),
(61, '98798798D', 'Dionisio', 'Rodriguez', 'Martin', 'Avda de Brasil 15', '4º B', 'JUBILADO', '1950-01-01', 'CASADO', 'ACTIVA', 'Estrabismo ojo izquierdo'),

-- LA CASA DE PAPEL (Miembros adicionales)
(53, '99999994R', 'Anibal', 'Cortes', 'Rio', 'Nave Industrial Toledo', NULL, 'DESEMPLEADO', '1992-05-15', 'SOLTERO', 'ACTIVA', 'Hacker, experto en sistemas'),
(54, '99999995D', 'Daniel', 'Ramos', 'Denver', 'Nave Industrial Toledo', NULL, 'DESEMPLEADO', '1988-11-20', 'SOLTERO', 'ACTIVA', 'Risa caracteristica'),
(55, '99999996N', 'Agata', 'Jimenez', 'Nairobi', 'Nave Industrial Toledo', NULL, 'DESEMPLEADO', '1982-07-10', 'SOLTERO', 'FALLECIDA', 'Experta falsificacion'),

-- ESTAFADORES / DELINCUENTES ADICIONALES
(62, '11111100S', 'Santi', 'Millan', 'Gomez', 'Calle Goya 45', '3º B', 'AUTONOMO', '1972-08-15', 'CASADO', 'ACTIVA', 'Estafador telefonico'),
(63, '11111101D', 'Antonio', 'Fernandez', 'Gil', 'Paseo de la Castellana 200', 'Of. 15', 'AUTONOMO', '1958-03-22', 'CASADO', 'ACTIVA', 'Director Forum Filatelico'),
(64, '11111102C', 'Maria', 'Garcia', 'Lopez', 'Calle Serrano 89', '5º A', 'EMPLEADO', '1965-09-10', 'DIVORCIADO', 'ACTIVA', 'Contable Forum Filatelico'),

-- NARCOTRAFICANTES ADICIONALES
(65, '22222200H', 'Hamid', 'Laroussi', NULL, 'Puerto Algeciras', NULL, 'DESEMPLEADO', '1980-04-05', 'SOLTERO', 'ACTIVA', 'Lider narcos, conexion Marruecos'),
(66, '22222201M', 'Mohamed', 'El Kassmi', NULL, 'Puerto Algeciras', NULL, 'DESEMPLEADO', '1985-08-12', 'SOLTERO', 'ACTIVA', 'Segundo narcos, lanchas rapidas'),
(67, '22222202A', 'Abdul', 'Rahman', 'Youssef', 'La Linea Concepcion', NULL, 'DESEMPLEADO', '1978-12-01', 'CASADO', 'ACTIVA', 'Logistica narcotrafico'),

-- BANDA DEL TALADRO
(68, '33333300A', 'Andrei', 'Popescu', NULL, 'Sin domicilio fijo', NULL, 'DESEMPLEADO', '1985-06-18', 'SOLTERO', 'ACTIVA', 'Lider banda taladro, experto cajas fuertes'),
(69, '33333301B', 'Bogdan', 'Ionescu', NULL, 'Sin domicilio fijo', NULL, 'DESEMPLEADO', '1988-02-25', 'SOLTERO', 'ACTIVA', 'Miembro banda taladro, vigilante'),

-- OTROS DELINCUENTES Y VICTIMAS
(70, '44444400V', 'Victima', 'Desconocida', 'Empresario', 'Barrio Salamanca', NULL, 'AUTONOMO', '1970-01-01', 'CASADO', 'FALLECIDA', 'Victima asesinato ajuste cuentas'),
(71, '44444401R', 'Alexei', 'Petrov', NULL, 'Hotel Palace', 'Habitacion 507', 'DESEMPLEADO', '1988-12-01', 'SOLTERO', 'ACTIVA', 'Lider banda Rolex'),
(72, '44444402D', 'Dimitri', 'Sokolov', NULL, 'Hotel Palace', 'Habitacion 508', 'DESEMPLEADO', '1991-03-18', 'SOLTERO', 'ACTIVA', 'Miembro banda Rolex'),
(73, '44444403E', 'Elena', 'Sanchez', 'Garcia', 'Avda de la Paz 67', '3º B', 'JUBILADO', '1950-02-14', 'VIUDO', 'ACTIVA', 'Victima phishing bancario'),
(74, '44444404H', 'David', 'Rodriguez', 'Martin', 'Calle Velazquez 45', '2º A', 'EMPLEADO', '1995-08-23', 'SOLTERO', 'ACTIVA', 'Hacker creador phishing'),
(75, '44444405A', 'Miguel', 'Torres', 'Navarro', 'Poligono Industrial', 'Nave 12', 'AUTONOMO', '1980-04-05', 'CASADO', 'ACTIVA', 'Conductor fugado atropello'),
(76, '44444406T', 'Chen', 'Wei', NULL, 'Sin domicilio conocido', NULL, 'DESEMPLEADO', '1975-10-10', 'CASADO', 'ACTIVA', 'Organizador red trata'),
(77, '44444407H', 'Wilson', 'Paredes', 'Quispe', 'Albergue Municipal', NULL, 'DESEMPLEADO', '1995-01-30', 'SOLTERO', 'ACTIVA', 'Lider banda hurtos'),
(78, '44444408J', 'Jefferson', 'Mamani', 'Cruz', 'Albergue Municipal', NULL, 'DESEMPLEADO', '1997-07-08', 'SOLTERO', 'ACTIVA', 'Miembro banda hurtos'),
(79, '44444409M', 'Marcos', 'Lopez', 'Caballero', 'Calle Luna 34', '5º B', 'EMPLEADO', '1988-10-09', 'SOLTERO', 'ACTIVA', 'Agresor sexual reincidente'),

-- CONDUCTORES PROFESIONALES
(80, '11223344X', 'Manolo', 'Garcia', 'Perez', 'Ctra Valencia km 4', NULL, 'EMPLEADO', '1968-02-02', 'CASADO', 'ACTIVA', 'Conductor de autobus'),
(81, '55667788Y', 'Paco', 'Martinez', 'Soria', 'Poligono Sur Nave 3', NULL, 'AUTONOMO', '1975-05-05', 'SOLTERO', 'ACTIVA', 'Camionero'),

-- VICTIMAS Y TESTIGOS ADICIONALES (serie 82-99)
(82, '55555500T', 'Laura', 'Fernandez', 'Ortiz', 'Calle Bravo Murillo 56', NULL, 'ESTUDIANTE', '2002-09-12', 'SOLTERO', 'ACTIVA', 'Testigo atropello'),
(83, '55555501J', 'Alberto', 'Ferrer', 'Mas', 'Calle Ortega y Gasset 22', 'Local', 'AUTONOMO', '1955-07-29', 'CASADO', 'ACTIVA', 'Propietario joyeria atracada'),
(84, '55555502R', 'Ricardo', 'Gomez', 'Perez', 'Calle Goya 156', '2º A', 'EMPLEADO', '1960-11-15', 'CASADO', 'ACTIVA', 'Victima atraco joyeria'),
(85, '55555503F', 'Fatima', 'Hassan', NULL, 'Centro de Acogida', NULL, 'DESEMPLEADO', '2000-01-01', 'SOLTERO', 'ACTIVA', 'Victima trata Marruecos'),
(86, '55555504B', 'Blessing', 'Okonkwo', NULL, 'Centro de Acogida', NULL, 'DESEMPLEADO', '1998-05-15', 'SOLTERO', 'ACTIVA', 'Victima trata Nigeria'),
(87, '55555505A', 'Amina', 'Diallo', NULL, 'Centro de Acogida', NULL, 'DESEMPLEADO', '1999-08-20', 'SOLTERO', 'ACTIVA', 'Victima trata Senegal'),
(88, '55555506C', 'Fernando', 'Blanco', 'Iglesias', 'Ayuntamiento', 'Concejalia', 'EMPLEADO', '1960-08-08', 'CASADO', 'ACTIVA', 'Concejal corrupto'),
(89, '55555507G', 'Hermanos', 'Gil', 'Constructora', 'Poligono Industrial', 'Of. 5', 'AUTONOMO', '1958-04-22', 'CASADO', 'ACTIVA', 'Constructor sobornos'),
(90, '55555508S', 'Ricardo', 'Soto', 'Mendez', 'Sin domicilio fijo', NULL, 'DESEMPLEADO', '1990-06-13', 'SOLTERO', 'ACTIVA', 'Secuestrador'),
(91, '55555509P', 'Patricia', 'Ramos', 'Diaz', 'Urbanizacion Moraleja', 'Chalet 15', 'EMPLEADO', '1985-11-25', 'CASADO', 'ACTIVA', 'Victima secuestro empresaria'),
(92, '55555510A', 'Alexandru', 'Stanescu', NULL, 'Sin domicilio fijo', NULL, 'EMPLEADO', '1985-05-18', 'CASADO', 'FALLECIDA', 'Victima accidente laboral'),
(93, '55555511U', 'Ruben', 'Castro', 'Gil', 'Barrio del Pilar', '3º C', 'ESTUDIANTE', '2003-02-17', 'SOLTERO', 'ACTIVA', 'Ultra violento bengalas'),
(94, '55555512V', 'Adrian', 'Navarro', 'Perez', 'Barrio del Pilar', '2º A', 'DESEMPLEADO', '2001-09-28', 'SOLTERO', 'ACTIVA', 'Ultra violento agresion'),
(95, '55555513H', 'Juan', 'Martinez', 'Lopez', 'Calle Mayor 12', '1º B', 'EMPLEADO', '1975-06-14', 'CASADO', 'ACTIVA', 'Herido pelea estadio'),
(96, '55555514I', 'Ignacio', 'Fuentes', 'Rojo', 'Calle del Prado 45', '1º Dcha', 'DESEMPLEADO', '1970-12-31', 'DIVORCIADO', 'ACTIVA', 'Piromano'),
(97, '55555515T', 'Teresa', 'Molina', 'Vega', 'Calle del Prado 47', '2º Izq', 'JUBILADO', '1940-05-05', 'VIUDO', 'ACTIVA', 'Testigo incendio'),
(98, '55555516Y', 'Yusuf', 'Al-Rashid', NULL, 'Sin domicilio fijo', NULL, 'DESEMPLEADO', '1985-03-20', 'SOLTERO', 'ACTIVA', 'Falsificador documentos'),
(99, '55555517I', 'Ibrahim', 'Mensah', NULL, 'Sin domicilio fijo', NULL, 'DESEMPLEADO', '1992-08-14', 'SOLTERO', 'ACTIVA', 'Comprador documentos falsos'),

-- =====================================================
-- PERSONAS: VICTIMAS, TESTIGOS Y SOSPECHOSOS
-- =====================================================

-- CASO ESTAFA PIRAMIDAL (Inspirado en Forum Filatélico)
(100, '12345678A', 'Manuel', 'Fernandez', 'Gomez', 'Calle Gran Via 45', '3º Izq', 'JUBILADO', '1945-03-15', 'VIUDO', 'ACTIVA', 'Victima estafa, perdio ahorros de toda su vida'),
(101, '12345679B', 'Carmen', 'Lopez', 'Ruiz', 'Calle Princesa 12', '2º Dcha', 'JUBILADO', '1948-07-22', 'VIUDO', 'ACTIVA', 'Victima estafa, 80000 euros perdidos'),
(102, '12345680C', 'Francisco', 'Sanchez', 'Moreno', 'Avda America 78', '5º A', 'AUTONOMO', '1960-11-30', 'CASADO', 'ACTIVA', 'Organizador estafa piramidal, huido'),
(103, '12345681D', 'Rosa', 'Martinez', 'Diaz', 'Calle Serrano 156', 'Atico', 'EMPLEADO', '1965-04-18', 'DIVORCIADO', 'ACTIVA', 'Complice en estafa, contable'),

-- CASO NARCOTRÁFICO PUERTO ALGECIRAS
(104, '23456789E', 'Mohamed', 'El Kouri', NULL, 'Puerto Algeciras', 'Contenedor 47', 'DESEMPLEADO', '1985-06-01', 'SOLTERO', 'ACTIVA', 'Narcotraficante, conexion Marruecos'),
(105, '23456790F', 'Juan Carlos', 'Delgado', 'Vega', 'Urbanizacion Sotogrande', 'Villa 23', 'AUTONOMO', '1970-09-14', 'CASADO', 'ACTIVA', 'Blanqueo de capitales, yates'),
(106, '23456791G', 'Antonio', 'Ruiz', 'Castaño', 'Calle Gibraltar 5', 'Bajo', 'DESEMPLEADO', '1990-02-28', 'SOLTERO', 'ACTIVA', 'Conduccion lanchas rapidas'),

-- CASO VIOLENCIA DE GÉNERO
(107, '34567890H', 'Maria', 'Gonzalez', 'Perez', 'Calle Alcala 234', '1º B', 'EMPLEADO', '1988-12-05', 'DIVORCIADO', 'ACTIVA', 'Victima violencia de genero'),
(108, '34567891I', 'Pedro', 'Jimenez', 'Torres', 'Calle Alcala 234', '1º B', 'DESEMPLEADO', '1982-08-19', 'DIVORCIADO', 'ACTIVA', 'Orden de alejamiento vigente'),

-- CASO ROBO CON ESCALO - BANDA DEL TALADRO
(109, '45678901J', 'Gheorghe', 'Ionescu', NULL, 'Sin domicilio fijo', NULL, 'DESEMPLEADO', '1992-03-25', 'SOLTERO', 'ACTIVA', 'Lider banda del taladro, especialista cajas fuertes'),
(110, '45678902K', 'Vasile', 'Popescu', NULL, 'Sin domicilio fijo', NULL, 'DESEMPLEADO', '1995-07-12', 'SOLTERO', 'ACTIVA', 'Miembro banda, vigilante'),
(111, '45678903L', 'Ion', 'Dumitrescu', NULL, 'Sin domicilio fijo', NULL, 'DESEMPLEADO', '1988-11-08', 'CASADO', 'ACTIVA', 'Miembro banda, conductor'),

-- CASO ASESINATO AJUSTE DE CUENTAS
(112, '56789012M', 'Carlos', 'Mendoza', 'Silva', 'Barrio Salamanca', 'Bajo Interior', 'DESEMPLEADO', '1978-05-30', 'SOLTERO', 'FALLECIDA', 'Victima tiroteo, 3 impactos de bala'),
(113, '56789013N', 'Roberto', 'Vargas', 'Luna', 'Calle Goya 89', '4º Dcha', 'AUTONOMO', '1975-01-17', 'CASADO', 'ACTIVA', 'Sospechoso principal, antecedentes'),

-- CASO ESTAFA ONLINE - PHISHING BANCARIO
(114, '67890123O', 'David', 'Rodriguez', 'Martin', 'Calle Velazquez 45', '2º A', 'EMPLEADO', '1995-08-23', 'SOLTERO', 'ACTIVA', 'Hacker, creador de phishing'),
(115, '67890124P', 'Elena', 'Sanchez', 'Garcia', 'Avda de la Paz 67', '3º B', 'JUBILADO', '1950-02-14', 'VIUDO', 'ACTIVA', 'Victima phishing, 15000 euros'),
(116, '67890125Q', 'Andres', 'Moreno', 'Lopez', 'Calle Mayor 123', '1º Izq', 'EMPLEADO', '1965-06-30', 'CASADO', 'ACTIVA', 'Victima phishing, 8000 euros'),

-- CASO ATROPELLO Y FUGA
(117, '78901234R', 'Laura', 'Vega', 'Santos', 'Calle Bravo Murillo 56', NULL, 'ESTUDIANTE', '2005-09-12', 'SOLTERO', 'ACTIVA', 'Victima atropello, lesiones graves'),
(118, '78901235S', 'Miguel', 'Torres', 'Navarro', 'Poligono Industrial', 'Nave 12', 'AUTONOMO', '1980-04-05', 'CASADO', 'ACTIVA', 'Conductor fugado, alcoholemia positiva'),

-- CASO ATRACO JOYERIA - ROLEX GANG
(119, '89012345T', 'Alexei', 'Petrov', NULL, 'Hotel Palace', 'Habitacion 507', 'DESEMPLEADO', '1988-12-01', 'SOLTERO', 'ACTIVA', 'Lider banda Rolex, origen ruso'),
(120, '89012346U', 'Dimitri', 'Sokolov', NULL, 'Hotel Palace', 'Habitacion 508', 'DESEMPLEADO', '1991-03-18', 'SOLTERO', 'ACTIVA', 'Miembro banda, especialista relojes'),
(121, '89012347V', 'Alberto', 'Ferrer', 'Mas', 'Calle Ortega y Gasset 22', 'Local', 'AUTONOMO', '1955-07-29', 'CASADO', 'ACTIVA', 'Propietario joyeria atracada'),

-- CASO TRAFICO DE PERSONAS
(122, '90123456W', 'Fatima', 'Hassan', NULL, 'Centro de Acogida', NULL, 'DESEMPLEADO', '2000-01-01', 'SOLTERO', 'ACTIVA', 'Victima trata, origen Marruecos'),
(123, '90123457X', 'Blessing', 'Okonkwo', NULL, 'Centro de Acogida', NULL, 'DESEMPLEADO', '1998-05-15', 'SOLTERO', 'ACTIVA', 'Victima trata, origen Nigeria'),
(124, '90123458Y', 'Chen', 'Wei', NULL, 'Sin domicilio conocido', NULL, 'DESEMPLEADO', '1975-10-10', 'CASADO', 'ACTIVA', 'Organizador red de trata'),

-- CASO CORRUPCION URBANISTICA
(125, '01234567Z', 'Fernando', 'Blanco', 'Iglesias', 'Ayuntamiento', 'Concejalia Urbanismo', 'EMPLEADO', '1960-08-08', 'CASADO', 'ACTIVA', 'Concejal corrupto, cohecho'),
(126, '11234568A', 'Constructora', 'Hermanos', 'Gil', 'Poligono Industrial', 'Oficinas 5', 'AUTONOMO', '1958-04-22', 'CASADO', 'ACTIVA', 'Empresario constructor, sobornos'),

-- CASO SECUESTRO EXPRESS
(127, '21234569B', 'Patricia', 'Ramos', 'Diaz', 'Urbanizacion La Moraleja', 'Chalet 15', 'EMPLEADO', '1985-11-25', 'CASADO', 'ACTIVA', 'Victima secuestro, empresaria'),
(128, '31234570C', 'Ricardo', 'Soto', 'Mendez', 'Sin domicilio fijo', NULL, 'DESEMPLEADO', '1990-06-13', 'SOLTERO', 'ACTIVA', 'Secuestrador, antecedentes'),

-- CASO VANDALISMO ESTADIO FUTBOL
(129, '41234571D', 'Ruben', 'Castro', 'Gil', 'Barrio del Pilar', '3º C', 'ESTUDIANTE', '2003-02-17', 'SOLTERO', 'ACTIVA', 'Ultra violento, bengalas'),
(130, '51234572E', 'Adrian', 'Navarro', 'Perez', 'Barrio del Pilar', '2º A', 'DESEMPLEADO', '2001-09-28', 'SOLTERO', 'ACTIVA', 'Ultra violento, agresion'),

-- CASO INCENDIO PROVOCADO
(131, '61234573F', 'Ignacio', 'Fuentes', 'Rojo', 'Calle del Prado 45', '1º Dcha', 'DESEMPLEADO', '1970-12-31', 'DIVORCIADO', 'ACTIVA', 'Piromano, 5 incendios en su haber'),
(132, '71234574G', 'Teresa', 'Molina', 'Vega', 'Calle del Prado 47', '2º Izq', 'JUBILADO', '1940-05-05', 'VIUDO', 'ACTIVA', 'Victima incendio, quemaduras'),

-- CASO FALSIFICACION DOCUMENTOS
(133, '81234575H', 'Yusuf', 'Al-Rashid', NULL, 'Sin domicilio fijo', NULL, 'DESEMPLEADO', '1985-03-20', 'SOLTERO', 'ACTIVA', 'Falsificador documentos, pasaportes'),
(134, '91234576I', 'Ibrahim', 'Mensah', NULL, 'Sin domicilio fijo', NULL, 'DESEMPLEADO', '1992-08-14', 'SOLTERO', 'ACTIVA', 'Comprador documentos falsos'),

-- CASO HURTO EN COMERCIOS - BANDA SUDAMERICANA
(135, '02345678J', 'Wilson', 'Paredes', 'Quispe', 'Albergue Municipal', NULL, 'DESEMPLEADO', '1995-01-30', 'SOLTERO', 'ACTIVA', 'Lider banda hurtos, tecnica escaparate'),
(136, '12345679K', 'Jefferson', 'Mamani', 'Cruz', 'Albergue Municipal', NULL, 'DESEMPLEADO', '1997-07-08', 'SOLTERO', 'ACTIVA', 'Miembro banda hurtos'),
(137, '22345680L', 'Byron', 'Gutierrez', 'Rojas', 'Albergue Municipal', NULL, 'DESEMPLEADO', '1994-11-22', 'SOLTERO', 'ACTIVA', 'Miembro banda hurtos, distractor'),

-- CASO AGRESION SEXUAL
(138, '32345681M', 'Sofia', 'Martin', 'Herrera', 'Confidencial', NULL, 'ESTUDIANTE', '2002-04-16', 'SOLTERO', 'ACTIVA', 'Victima agresion sexual'),
(139, '42345682N', 'Marcos', 'Lopez', 'Caballero', 'Calle Luna 34', '5º B', 'EMPLEADO', '1988-10-09', 'SOLTERO', 'ACTIVA', 'Agresor sexual, reincidente'),

-- CASO ROBO VIVIENDA - BUTRONEROS
(140, '52345683O', 'Sergei', 'Volkov', NULL, 'Sin domicilio fijo', NULL, 'DESEMPLEADO', '1983-06-25', 'DIVORCIADO', 'ACTIVA', 'Lider banda butroneros'),
(141, '62345684P', 'Nikolai', 'Fedorov', NULL, 'Sin domicilio fijo', NULL, 'DESEMPLEADO', '1987-02-12', 'SOLTERO', 'ACTIVA', 'Miembro banda, experto alarmas'),
(142, '72345685Q', 'Ana', 'Beltrán', 'Sanz', 'Calle Ibiza 56', '4º A', 'EMPLEADO', '1975-09-03', 'CASADO', 'ACTIVA', 'Victima robo vivienda, 50000 euros joyas'),

-- CASO TERRORISMO - CELULA YIHADISTA
(143, '82345686R', 'Hassan', 'Mohammed', NULL, 'Vigilancia CNI', NULL, 'DESEMPLEADO', '1990-04-01', 'SOLTERO', 'ACTIVA', 'Sospechoso terrorismo, captador'),
(144, '92345687S', 'Omar', 'Benali', NULL, 'Vigilancia CNI', NULL, 'ESTUDIANTE', '2000-08-20', 'SOLTERO', 'ACTIVA', 'Radicalizado, redes sociales'),

-- CASO MALTRATO ANIMAL
(145, '03456789T', 'Joaquin', 'Herrero', 'Pardo', 'Finca Las Encinas', 'Parcela 7', 'AUTONOMO', '1965-12-12', 'CASADO', 'ACTIVA', 'Maltrato animal, perrera ilegal'),

-- CASO ACCIDENTE LABORAL MORTAL
(146, '13456790U', 'Alexandru', 'Stanescu', NULL, 'Sin domicilio fijo', NULL, 'EMPLEADO', '1985-05-18', 'CASADO', 'FALLECIDA', 'Victima accidente laboral, caida andamio'),
(147, '23456791V', 'Marcos', 'Empresa', 'Construcciones', 'Calle Industria 45', 'Oficina 3', 'AUTONOMO', '1960-03-07', 'CASADO', 'ACTIVA', 'Empresario, incumplimiento seguridad'),

-- CASO CIBERACOSO MENORES
(148, '33456792W', 'Menor', 'Protegido', 'Uno', 'Confidencial', NULL, 'ESTUDIANTE', '2010-07-14', 'SOLTERO', 'ACTIVA', 'Victima ciberacoso'),
(149, '43456793X', 'Daniel', 'Ortiz', 'Ramos', 'Calle Mayor 78', '2º D', 'EMPLEADO', '1980-01-23', 'DIVORCIADO', 'ACTIVA', 'Acosador menores, grooming'),

-- CASO OCUPACION ILEGAL
(150, '53456794Y', 'Rosa', 'Hernandez', 'Lopez', 'Calle Embajadores 123', '1º A', 'JUBILADO', '1942-11-11', 'VIUDO', 'ACTIVA', 'Victima ocupacion, anciana'),
(151, '63456795Z', 'Kevin', 'Mora', 'Santos', 'Sin domicilio fijo', NULL, 'DESEMPLEADO', '1995-04-29', 'SOLTERO', 'ACTIVA', 'Okupa, antecedentes'),

-- CASO FRAUDE SEGUROS
(152, '73456796A', 'Angel', 'Duran', 'Nieto', 'Calle Arturo Soria 234', '3º C', 'AUTONOMO', '1972-08-16', 'CASADO', 'ACTIVA', 'Fraude seguros, simulacion accidentes'),
(153, '83456797B', 'Dr. Luis', 'Cortes', 'Medico', 'Clinica Privada', 'Consulta 5', 'AUTONOMO', '1965-02-28', 'CASADO', 'ACTIVA', 'Complice fraude, informes falsos'),

-- CASO CONTRABANDO TABACO
(154, '93456798C', 'Giovanni', 'Ferrara', NULL, 'Puerto de Valencia', 'Muelle 3', 'AUTONOMO', '1978-10-05', 'CASADO', 'ACTIVA', 'Contrabandista, conexion italiana'),
(155, '04567890D', 'Jose', 'Camacho', 'Vidal', 'La Linea de la Concepcion', 'Barrio Alto', 'DESEMPLEADO', '1990-06-18', 'SOLTERO', 'ACTIVA', 'Contrabandista, lanchas'),

-- CASO EXTORSION A COMERCIANTES
(156, '14567891E', 'Li', 'Chen', NULL, 'Barrio de Usera', 'Local 23', 'AUTONOMO', '1970-03-30', 'CASADO', 'ACTIVA', 'Victima extorsion, restaurante chino'),
(157, '24567892F', 'Wang', 'Xiaoming', NULL, 'Sin domicilio fijo', NULL, 'DESEMPLEADO', '1985-09-12', 'SOLTERO', 'ACTIVA', 'Extorsionador, mafia china'),

-- VICTIMAS Y TESTIGOS ADICIONALES
(158, '34567893G', 'Lucia', 'Fernandez', 'Ortega', 'Calle Atocha 45', '2º B', 'EMPLEADO', '1990-05-20', 'SOLTERO', 'ACTIVA', 'Testigo atraco banco'),
(159, '44567894H', 'Pablo', 'Diaz', 'Romero', 'Avda de la Albufera 78', '4º A', 'EMPLEADO', '1985-12-03', 'CASADO', 'ACTIVA', 'Victima robo con violencia'),
(160, '54567895I', 'Sandra', 'Gil', 'Navarro', 'Calle Fuencarral 134', '1º Izq', 'ESTUDIANTE', '2000-08-17', 'SOLTERO', 'ACTIVA', 'Testigo agresion'),
(161, '64567896J', 'Raul', 'Prieto', 'Mendez', 'Calle Hortaleza 67', '3º Dcha', 'AUTONOMO', '1978-04-11', 'DIVORCIADO', 'ACTIVA', 'Victima estafa inmobiliaria'),
(162, '74567897K', 'Beatriz', 'Sanchez', 'Vega', 'Paseo de la Castellana 200', 'Atico', 'EMPLEADO', '1982-09-25', 'CASADO', 'ACTIVA', 'Victima robo vehiculo'),
(163, '84567898L', 'Oscar', 'Martin', 'Cruz', 'Calle de Toledo 89', '2º C', 'DESEMPLEADO', '1993-01-07', 'SOLTERO', 'ACTIVA', 'Testigo tiroteo'),
(164, '94567899M', 'Cristina', 'Lopez', 'Flores', 'Avda de Portugal 23', '5º B', 'EMPLEADO', '1987-06-14', 'CASADO', 'ACTIVA', 'Victima violencia domestica'),
(165, '05678901N', 'Javier', 'Ruiz', 'Santos', 'Calle de Goya 156', '4º Izq', 'AUTONOMO', '1975-11-28', 'CASADO', 'ACTIVA', 'Victima secuestro express'),

-- PERSONAS NO IDENTIFICADAS (Casos sin resolver)
(170, '00000001X', 'Desconocido', 'Masculino', 'Uno', 'Sin domicilio', NULL, 'DESEMPLEADO', '1990-01-01', 'SOLTERO', 'NO_IDENTIFICADA', 'Cadaver hallado rio Manzanares, varon 30-40 años'),
(171, '00000002Y', 'Desconocida', 'Femenina', 'Una', 'Sin domicilio', NULL, 'DESEMPLEADO', '1985-01-01', 'SOLTERO', 'NO_IDENTIFICADA', 'Cadaver hallado descampado, mujer 35-45 años'),
(172, '00000003Z', 'Desconocido', 'Masculino', 'Dos', 'Sin domicilio', NULL, 'DESEMPLEADO', '1970-01-01', 'SOLTERO', 'NO_IDENTIFICADA', 'Restos oseos Casa de Campo'),

-- DESAPARECIDOS
(175, '11111111A', 'Marta', 'Calvo', 'Martin', 'Calle de la Esperanza 12', '3º A', 'EMPLEADO', '1993-04-08', 'SOLTERO', 'DESAPARECIDA', 'Desaparecida desde hace 2 años, ultima vez vista en discoteca'),
(176, '22222222B', 'Diana', 'Quer', 'Lopez', 'Urbanizacion A Pobra', NULL, 'ESTUDIANTE', '1998-08-22', 'SOLTERO', 'DESAPARECIDA', 'Desaparecida en verano, investigacion activa'),

-- FALLECIDOS EN ACTO DE SERVICIO
(180, '33333333C', 'Jorge', 'Garcia', 'Policia', 'Comisaria Centro', NULL, 'EMPLEADO', '1985-02-14', 'CASADO', 'FALLECIDA', 'Agente fallecido en tiroteo'),

-- INFORMANTES CONFIDENCIALES
(185, '44444444D', 'Confidente', 'Alfa', NULL, 'Confidencial', NULL, 'DESEMPLEADO', '1980-06-01', 'SOLTERO', 'ACTIVA', 'Informante narcotrafico'),
(186, '55555555E', 'Confidente', 'Beta', NULL, 'Confidencial', NULL, 'EMPLEADO', '1975-03-15', 'CASADO', 'ACTIVA', 'Informante mafia rusa'),

-- TESTIGOS PROTEGIDOS
(190, '66666666F', 'Testigo', 'Protegido', 'Alfa', 'Programa Proteccion', NULL, 'DESEMPLEADO', '1988-09-22', 'DIVORCIADO', 'ACTIVA', 'Testigo caso narcotrafico mayor'),
(191, '77777777G', 'Testigo', 'Protegido', 'Beta', 'Programa Proteccion', NULL, 'EMPLEADO', '1990-12-05', 'SOLTERO', 'ACTIVA', 'Testigo caso corrupcion politica');


-- -----------------------------------------------------
-- 7. DELINCUENTES 
-- -----------------------------------------------------
INSERT INTO Delincuente (id_persona, condenaDias, situacionProcesal, alias) VALUES 
(20, 30, 'IMPUTADO', 'El Rancio'),        
(22, 0, 'INVESTIGACION', 'El Cuqui'),      
(40, 100, 'ABSUELTO', 'El Luisma'),        
(41, 0, 'INVESTIGACION', 'Machu Picchu'), 
(50, 0, 'INVESTIGACION', 'El Profesor'),
(51, 5000, 'IMPUTADO', 'Tokyo'),
(52, 0, 'CONDENADO', 'Berlin'),
-- Casa de Papel adicionales
(53, 3650, 'IMPUTADO', 'Rio'),
(54, 3650, 'IMPUTADO', 'Denver'),
(55, 0, 'CONDENADO', 'Nairobi'),
-- Quinquis
(60, 10, 'IMPUTADO', 'Torrente'),
(61, 2000, 'CONDENADO', 'El Dioni'),
(62, 180, 'IMPUTADO', 'Santi El Estafador'),
-- Estafadores Forum
(63, 0, 'INVESTIGACION', 'El Director Forum'),
(64, 365, 'IMPUTADO', 'La Contable Forum'),
-- Narcotraficantes nuevos
(65, 5475, 'CONDENADO', 'Hamid'),
(66, 3650, 'IMPUTADO', 'Mohamed El Kassmi'),
(67, 1825, 'IMPUTADO', 'Abdul'),
-- Banda del Taladro
(68, 2920, 'CONDENADO', 'Andrei El Taladro'),
(69, 2190, 'IMPUTADO', 'Bogdan'),
-- Rolex Gang nuevos
(71, 0, 'INVESTIGACION', 'Alexei Rolex'),
(72, 0, 'INVESTIGACION', 'Dimitri Rolex'),
-- Phishing
(74, 730, 'IMPUTADO', 'PhishKing Junior'),
-- Atropello
(75, 1095, 'IMPUTADO', 'El Fugado'),
-- Trata
(76, 7300, 'CONDENADO', 'Chen El Tratante'),
-- Hurtos
(77, 365, 'IMPUTADO', 'Wilson El Escaparate'),
(78, 270, 'IMPUTADO', 'Jefferson'),
-- Agresor
(79, 2555, 'CONDENADO', 'El Acosador'),
-- Corrupcion
(88, 0, 'INVESTIGACION', 'El Concejal Corrupto'),
(89, 0, 'INVESTIGACION', 'El Constructor'),
-- Secuestro
(90, 3650, 'CONDENADO', 'El Secuestrador'),
-- Ultras
(93, 90, 'IMPUTADO', 'Bengalas'),
(94, 180, 'IMPUTADO', 'El Ultra'),
-- Piromano
(96, 1825, 'CONDENADO', 'El Piromano'),
-- Falsificador
(98, 1095, 'IMPUTADO', 'El Falsificador'),
(99, 365, 'IMPUTADO', 'El Comprador'),
-- Estafadores originales
(102, 0, 'INVESTIGACION', 'El Financiero'),
(103, 180, 'IMPUTADO', 'La Contable'),
-- Narcotraficantes
(104, 3650, 'CONDENADO', 'El Moro'),
(105, 0, 'INVESTIGACION', 'El Yatero'),
(106, 1825, 'IMPUTADO', 'Fueraborda'),
-- Violencia de género
(108, 365, 'CONDENADO', 'El Maltratador'),
-- Banda del taladro
(109, 2920, 'CONDENADO', 'El Taladro'),
(110, 1460, 'IMPUTADO', 'El Vigilante'),
(111, 1095, 'IMPUTADO', 'El Piloto'),
-- Ajuste de cuentas
(113, 0, 'INVESTIGACION', 'El Sicario'),
-- Ciberdelincuentes
(114, 0, 'INVESTIGACION', 'PhishKing'),
-- Atropello y fuga
(118, 730, 'IMPUTADO', 'El Fugado'),
-- Rolex Gang
(119, 0, 'INVESTIGACION', 'Rolex Alexei'),
(120, 0, 'INVESTIGACION', 'Rolex Dimitri'),
-- Trata de personas
(124, 7300, 'CONDENADO', 'El Chino'),
-- Corrupción
(125, 0, 'INVESTIGACION', 'El Concejal'),
(126, 0, 'INVESTIGACION', 'El Constructor'),
-- Secuestro
(128, 3650, 'CONDENADO', 'El Secuestrador'),
-- Ultras
(129, 90, 'IMPUTADO', 'Bengalas'),
(130, 180, 'IMPUTADO', 'El Ultra'),
-- Pirómano
(131, 1825, 'CONDENADO', 'El Pirómano'),
-- Falsificador
(133, 1095, 'IMPUTADO', 'El Falsificador'),
-- Banda de hurtos
(135, 365, 'IMPUTADO', 'El Escaparate'),
(136, 270, 'IMPUTADO', 'El Rápido'),
(137, 180, 'IMPUTADO', 'El Distractor'),
-- Agresor sexual
(139, 2555, 'CONDENADO', 'El Depredador'),
-- Butroneros
(140, 1460, 'IMPUTADO', 'El Butrón'),
(141, 1095, 'IMPUTADO', 'El Alarmas'),
-- Terrorismo
(143, 0, 'INVESTIGACION', 'El Captador'),
(144, 0, 'INVESTIGACION', 'El Radicalizado'),
-- Maltrato animal
(145, 365, 'IMPUTADO', 'El Perrero'),
-- Accidente laboral
(147, 0, 'INVESTIGACION', 'El Negligente'),
-- Ciberacoso
(149, 730, 'CONDENADO', 'El Groomer'),
-- Okupas
(151, 90, 'IMPUTADO', 'El Okupa'),
-- Fraude seguros
(152, 0, 'INVESTIGACION', 'El Simulador'),
(153, 0, 'INVESTIGACION', 'Dr. Fraude'),
-- Contrabando
(154, 1095, 'IMPUTADO', 'El Italiano'),
(155, 730, 'IMPUTADO', 'El Lanchero'),
-- Extorsión
(157, 1460, 'CONDENADO', 'Triada Wang');

-- -----------------------------------------------------
-- 8. RECURSOS: LICENCIAS Y DATOS
-- -----------------------------------------------------
INSERT INTO Licencia (id_licencia, nombre) VALUES 
(1, 'Permiso Armas B'), 
(2, 'Conducir B'), 
(3, 'C+E (Camion)'), 
(4, 'D (Autobus)'), 
(5, 'AM (Ciclomotor)'),
(6, 'Permiso Armas A'),
(7, 'Conducir A (Moto)'),
(8, 'Licencia Caza'),
(9, 'Licencia Pesca'),
(10, 'Permiso Armas F (Deportivo)');

INSERT INTO Datos (id_persona, fechaEmision, fechaValidez, id_licencia) VALUES 
(30, '2020-01-01', '2030-01-01', 1),
(20, '2018-05-15', '2028-05-15', 2),
(22, '2019-03-20', '2029-03-20', 2),
(23, '2015-08-10', '2025-08-10', 2),
(30, '2017-02-28', '2027-02-28', 2),
(41, '2016-11-05', '2026-11-05', 1),
(41, '2016-11-05', '2026-11-05', 8),
(60, '2010-06-01', '2020-06-01', 2), 
(80, '2015-03-15', '2025-03-15', 4),
(81, '2018-09-22', '2028-09-22', 3),
(105, '2019-01-10', '2029-01-10', 7),
(113, '2017-04-18', '2027-04-18', 1),
(118, '2020-07-30', '2030-07-30', 2),
(121, '2012-12-12', '2022-12-12', 2),
(125, '2019-05-05', '2029-05-05', 2),
(126, '2018-08-20', '2028-08-20', 3),
(127, '2021-02-14', '2031-02-14', 2),
(142, '2016-10-10', '2026-10-10', 2),
(142, '2020-03-15', '2030-03-15', 1), -- Licencia armas para RF.07
(147, '2014-06-06', '2024-06-06', 3),
(152, '2020-11-11', '2030-11-11', 2),
(154, '2017-03-03', '2027-03-03', 7),
(159, '2019-09-09', '2029-09-09', 2),
(161, '2018-04-04', '2028-04-04', 2),
(162, '2021-01-01', '2031-01-01', 2),
(165, '2015-07-07', '2025-07-07', 2);

-- -----------------------------------------------------
-- 9. FLOTA DE VEHÍCULOS
-- -----------------------------------------------------
INSERT INTO Vehiculo (id_vehiculo, matricula, tipo, modelo, color, estaAsegurado, anioFabricacion, robado, id_unidad, id_propietario) VALUES 
-- POLICÍA (20 vehículos)
(1, 'CNP-1111', 'COCHE', 'Citroen C4 Picasso', 'Azul', 1, 2018, 0, 1, NULL),
(2, 'CNP-2222', 'COCHE', 'Toyota Prius Hibrido', 'Azul', 1, 2020, 0, 1, NULL),
(3, 'CNP-3333', 'FURGONETA', 'Mercedes Sprinter UIP', 'Azul Oscuro', 1, 2019, 0, 3, NULL),
(4, 'CNP-4444', 'COCHE', 'Opel Insignia Camuflado', 'Gris', 1, 2021, 0, 4, NULL),
(5, 'CNP-5555', 'MOTO', 'BMW R1200RT', 'Blanco', 1, 2017, 0, 5, NULL),
(6, 'CNP-6666', 'MOTO', 'Yamaha FJR1300', 'Blanco', 1, 2018, 0, 5, NULL),
(7, 'CNP-7777', 'COCHE', 'Seat Leon Cupra', 'Blanco', 1, 2022, 0, 6, NULL),
(8, 'CNP-8888', 'FURGONETA', 'Iveco Daily Cientifica', 'Blanco', 1, 2020, 0, 2, NULL),
(9, 'CNP-9999', 'COCHE', 'Ford Focus ST', 'Azul', 1, 2021, 0, 7, NULL),
(21, 'CNP-1010', 'FURGONETA', 'Mercedes Vito K9', 'Azul', 1, 2019, 0, 8, NULL),
(22, 'CNP-1212', 'COCHE', 'Skoda Octavia RS', 'Blanco', 1, 2022, 0, 10, NULL),
(23, 'CNP-1313', 'COCHE', 'Peugeot 308 GTI', 'Azul', 1, 2021, 0, 11, NULL),
(24, 'CNP-1414', 'COCHE', 'Renault Megane RS', 'Blanco', 1, 2020, 0, 12, NULL),
(25, 'CNP-1515', 'COCHE', 'Volkswagen Golf R', 'Gris', 1, 2022, 0, 13, NULL),
(26, 'CNP-1616', 'FURGONETA', 'Renault Trafic', 'Azul', 1, 2019, 0, 14, NULL),
(27, 'CNP-1717', 'COCHE', 'BMW Serie 3', 'Negro Camuflado', 1, 2021, 0, 15, NULL),
(28, 'CNP-1818', 'MOTO', 'Honda CBR600RR', 'Blanco', 1, 2020, 0, 5, NULL),
(29, 'CNP-1919', 'COCHE', 'Audi A4 Avant', 'Gris', 1, 2022, 0, 4, NULL),
(30, 'CNP-2020', 'FURGONETA', 'Ford Transit Antidisturbios', 'Azul Oscuro', 1, 2018, 0, 7, NULL),

-- CIUDADANOS
(10, '9821-LXZ', 'FURGONETA', 'Mercedes Vito Frigo', 'Blanco', 1, 2015, 0, NULL, 20),
(11, '6969-CPC', 'COCHE', 'Mercedes CLK Descapotable', 'Rojo', 0, 2005, 0, NULL, 22), 
(12, '1234-BLL', 'CICLOMOTOR', 'Derbi Variant', 'Negro', 1, 1992, 0, NULL, 24),
(13, '4321-MZX', 'COCHE', 'Ford Mondeo Ghia', 'Gris Plata', 1, 2002, 0, NULL, 30),
(14, '1965-MFT', 'COCHE', 'Seat 1430', 'Marron Oxido', 0, 1978, 0, NULL, 60),
(15, '0000-BXX', 'FURGONETA', 'Furgon Blindado Prosegur', 'Amarillo', 1, 1989, 1, NULL, NULL), 
(16, '9999-HDP', 'COCHE', 'Seat Ibiza 1.9 TDI', 'Rojo', 1, 1999, 1, NULL, 50),
(17, '5555-MLZ', 'CICLOMOTOR', 'Vespino ALX', 'Blanco', 0, 1995, 0, NULL, 40),
(18, '1234-BRS', 'AUTOBUS', 'Iveco Urbanway', 'Azul EMT', 1, 2016, 0, NULL, 80),
(19, '5678-TRK', 'CAMION', 'Volvo FH16', 'Blanco', 1, 2022, 0, NULL, 81),
(20, '1111-RTN', 'MOTO', 'Kawasaki Ninja', 'Verde', 0, 2023, 1, NULL, NULL),

-- VEHÍCULOS DE CASOS CRIMINALES
-- Estafadores
(31, '2345-FGH', 'COCHE', 'Porsche Cayenne', 'Negro', 1, 2020, 0, NULL, 102),
(32, '3456-JKL', 'COCHE', 'BMW X5', 'Blanco', 1, 2019, 0, NULL, 103),

-- Narcotraficantes
(33, '4567-MNP', 'COCHE', 'Range Rover Sport', 'Negro', 1, 2021, 0, NULL, 105),
(34, '5678-KRS', 'FURGONETA', 'Ford Transit Camper', 'Gris', 1, 2018, 0, NULL, 104),
(35, '6789-TVV', 'MOTO', 'Yamaha MT-09', 'Negra', 0, 2022, 0, NULL, 106),

-- Violencia de género
(36, '7890-WXY', 'COCHE', 'Volkswagen Polo', 'Blanco', 1, 2017, 0, NULL, 108),

-- Banda del taladro
(37, '8901-ZBB', 'FURGONETA', 'Peugeot Partner', 'Blanco', 0, 2015, 0, NULL, 109),
(38, '9012-CDF', 'COCHE', 'Opel Astra', 'Gris', 0, 2014, 0, NULL, 111),

-- Rolex Gang
(39, '1122-FGH', 'COCHE', 'Mercedes Clase S', 'Negro', 1, 2022, 0, NULL, 119),
(40, '2233-JKL', 'COCHE', 'Audi A8', 'Negro', 1, 2021, 0, NULL, 120),

-- Trata de personas
(41, '3344-MNP', 'FURGONETA', 'Iveco Daily', 'Blanco', 0, 2010, 0, NULL, 124),

-- Corrupción
(42, '4455-KRS', 'COCHE', 'Jaguar XF', 'Azul', 1, 2020, 0, NULL, 125),
(43, '5566-TVV', 'COCHE', 'Mercedes Clase E', 'Negro', 1, 2019, 0, NULL, 126),

-- Secuestro
(44, '6677-WXY', 'FURGONETA', 'Renault Kangoo', 'Blanco', 0, 2016, 0, NULL, 128),
-- Ultras
(45, '7788-ZBB', 'COCHE', 'Seat Ibiza FR', 'Rojo', 1, 2018, 0, NULL, 129),
(46, '8899-CDF', 'COCHE', 'Peugeot 206 GTI', 'Negro', 0, 2005, 0, NULL, 130),

-- Pirómano
(47, '9900-FGH', 'COCHE', 'Citroen C3', 'Gris', 0, 2012, 0, NULL, 131),

-- Butroneros
(48, '1011-JKL', 'FURGONETA', 'Volkswagen Crafter', 'Blanco', 0, 2017, 0, NULL, 140),
(49, '1213-MNP', 'COCHE', 'Skoda Fabia', 'Gris', 0, 2015, 0, NULL, 141),

-- Contrabando
(50, '1415-KRS', 'CAMION', 'DAF XF', 'Blanco', 1, 2019, 0, NULL, 154),
(51, '1617-TVV', 'FURGONETA', 'Mercedes Sprinter', 'Blanco', 0, 2018, 0, NULL, 155),

-- Fraude seguros (coches siniestrados)
(52, '1819-WXY', 'COCHE', 'Audi A3', 'Negro', 1, 2020, 0, NULL, 152),

-- VEHÍCULOS DE VÍCTIMAS
(53, '2021-ZBB', 'COCHE', 'Toyota Corolla', 'Gris', 1, 2019, 0, NULL, 100),
(54, '2223-CDF', 'COCHE', 'Renault Clio', 'Rojo', 1, 2018, 0, NULL, 101),
(55, '2425-FGH', 'COCHE', 'Ford Fiesta', 'Azul', 1, 2017, 0, NULL, 107),
(56, '2627-JKL', 'COCHE', 'Hyundai Tucson', 'Blanco', 1, 2021, 0, NULL, 117),
(57, '2829-MNP', 'COCHE', 'Kia Sportage', 'Gris', 1, 2020, 0, NULL, 121),
(58, '3031-KRS', 'COCHE', 'Nissan Qashqai', 'Negro', 1, 2019, 0, NULL, 127),
(59, '3233-TVV', 'COCHE', 'Mazda CX-5', 'Rojo', 1, 2022, 0, NULL, 142),
(60, '3435-WXY', 'COCHE', 'Honda CR-V', 'Blanco', 1, 2018, 0, NULL, 150),
(61, '3637-ZBB', 'COCHE', 'Volvo XC60', 'Negro', 1, 2021, 0, NULL, 156),

-- VEHÍCULOS ROBADOS (casos activos)
(62, '3839-CDF', 'COCHE', 'BMW Serie 5', 'Negro', 1, 2022, 1, NULL, 159),
(63, '4041-FGH', 'MOTO', 'Ducati Monster', 'Roja', 1, 2021, 1, NULL, 161),
(64, '4243-JKL', 'COCHE', 'Audi Q7', 'Blanco', 1, 2023, 1, NULL, 162),
(65, '4445-MNP', 'COCHE', 'Mercedes GLC', 'Gris', 1, 2022, 1, NULL, 165),

-- VEHÍCULOS IMPLICADOS EN ACCIDENTES
(66, '4647-KRS', 'COCHE', 'Dacia Sandero', 'Blanco', 1, 2020, 0, NULL, 118),
(67, '4849-TVV', 'MOTO', 'Honda CBR1000RR', 'Roja', 0, 2019, 0, NULL, NULL),

-- VEHÍCULOS ADICIONALES CIUDADANOS
(68, '5051-WXY', 'COCHE', 'Seat Leon', 'Gris', 1, 2018, 0, NULL, 23),
(69, '5253-ZBB', 'COCHE', 'Volkswagen Golf', 'Negro', 1, 2019, 0, NULL, 32),
(70, '5455-CDF', 'CICLOMOTOR', 'Piaggio Liberty', 'Blanco', 1, 2020, 0, NULL, 33),
(71, '5657-FGH', 'COCHE', 'Opel Corsa', 'Rojo', 1, 2017, 0, NULL, 34),
(72, '5859-JKL', 'COCHE', 'Fiat 500', 'Amarillo', 1, 2021, 0, NULL, 21),
(73, '6061-MNP', 'COCHE', 'Citroen C4 Cactus', 'Verde', 1, 2019, 0, NULL, 41),
(74, '6263-KRS', 'FURGONETA', 'Nissan NV200', 'Blanco', 1, 2018, 0, NULL, 61),
(75, '6465-TVV', 'COCHE', 'Peugeot 3008', 'Gris', 1, 2020, 0, NULL, 51),

-- VEHÍCULOS SIN PROPIETARIO CONOCIDO (abandonados/recuperados)
(76, '6667-WXY', 'COCHE', 'Renault Megane', 'Azul', 0, 2008, 0, NULL, NULL),
(77, '6869-ZBB', 'FURGONETA', 'Citroen Berlingo', 'Blanco', 0, 2005, 0, NULL, NULL),
(78, '7071-CDF', 'COCHE', 'Seat Toledo', 'Gris', 0, 2003, 0, NULL, NULL),
(79, '7273-FGH', 'MOTO', 'Suzuki GSX-R', 'Azul', 0, 2015, 0, NULL, NULL),
(80, '7475-JKL', 'COCHE', 'Ford Ka', 'Rojo', 0, 2010, 0, NULL, NULL),

-- VEHÍCULOS PESADOS ADICIONALES
(81, '7677-MNP', 'AUTOBUS', 'Mercedes Citaro', 'Azul EMT', 1, 2018, 0, NULL, NULL),
(82, '7879-KRS', 'CAMION', 'MAN TGX', 'Blanco', 1, 2020, 0, NULL, NULL),
(83, '8081-TVV', 'CAMION', 'Scania R500', 'Azul', 1, 2021, 0, NULL, NULL),
(84, '8283-WXY', 'AUTOBUS', 'Volvo 7900', 'Verde Interurbano', 1, 2019, 0, NULL, NULL),

-- VEHÍCULOS DE LUJO (casos especiales)
(85, '8485-ZBB', 'COCHE', 'Ferrari 488', 'Rojo', 1, 2020, 0, NULL, 105),
(86, '8687-CDF', 'COCHE', 'Lamborghini Urus', 'Amarillo', 1, 2022, 0, NULL, 102),
(87, '8889-FGH', 'COCHE', 'Bentley Continental', 'Negro', 1, 2021, 0, NULL, 126),
(88, '9091-JKL', 'COCHE', 'Rolls Royce Ghost', 'Blanco', 1, 2023, 1, NULL, NULL),

-- CICLOMOTORES Y MOTOS ADICIONALES
(89, '9293-MNP', 'CICLOMOTOR', 'Vespa Primavera', 'Azul', 1, 2019, 0, NULL, 158),
(90, '9495-KRS', 'MOTO', 'Triumph Street Triple', 'Blanca', 1, 2020, 0, NULL, 163),
(91, '9697-TVV', 'MOTO', 'KTM Duke 390', 'Naranja', 1, 2021, 0, NULL, 160),
(92, '9899-WXY', 'CICLOMOTOR', 'Kymco Agility', 'Negro', 1, 2018, 0, NULL, 164),

-- VEHÍCULOS HISTÓRICOS/ESPECIALES
(93, '0001-HJS', 'COCHE', 'Seat 600', 'Blanco', 0, 1965, 0, NULL, 61),
(94, '0002-HJS', 'COCHE', 'Renault 4L', 'Verde', 0, 1970, 0, NULL, NULL),
(95, '0003-HJS', 'MOTO', 'Bultaco Metralla', 'Roja', 0, 1968, 0, NULL, NULL),

-- VEHÍCULOS TAXI/VTC
(96, '1234-TXJ', 'COCHE', 'Toyota Prius Taxi', 'Blanco', 1, 2019, 0, NULL, NULL),
(97, '2345-TXJ', 'COCHE', 'Skoda Superb Taxi', 'Blanco', 1, 2020, 0, NULL, NULL),
(98, '3456-VTC', 'COCHE', 'Tesla Model 3', 'Negro', 1, 2022, 0, NULL, NULL),
(99, '4567-VTC', 'COCHE', 'Mercedes Clase V', 'Negro', 1, 2021, 0, NULL, NULL),

-- VEHÍCULOS AMBULANCIA/EMERGENCIAS 
(100, '5678-SFM', 'FURGONETA', 'Mercedes Sprinter Ambulancia', 'Blanco', 1, 2020, 0, NULL, NULL),

-- Victima robo con armas y vehiculo
(101, '1234-RNR', 'COCHE', 'Toyota Yaris', 'Blanco', 1, 2019, 0, NULL, 142);

-- -----------------------------------------------------
-- 10. ARMAS 
-- -----------------------------------------------------
INSERT INTO Arma (id_arma, numeroSerie, tipo, modelo, condicion, origen, id_propietario, id_datos) VALUES 
-- Originales
(1, 'GLOCK-PAC-01', 'ARMA_DE_FUEGO_CORTA', 'Glock 17 Gen5', 'OPERATIVA', 'LEGAL', NULL, NULL),
(2, 'CENTOLLO-01', 'ARMA_CONTUNDENTE', 'Centollo Congelado 2kg', 'INUTILIZADA', 'LEGAL', 20, NULL),
(3, 'ESCOPETA-MAU', 'ARMA_DE_FUEGO_LARGA', 'Escopeta Caza Beretta', 'OPERATIVA', 'ILEGAL', 41, NULL),
(4, 'MAGNUM-TORR', 'ARMA_DE_FUEGO_CORTA', 'Magnum 44', 'DETERIORADA', 'ILEGAL', 60, NULL),
(5, 'AK47-BERLIN', 'AMETRALLADORA', 'Kalashnikov AK-47', 'NUEVA', 'ILEGAL', 52, NULL),
(6, 'NAVAJA-LUI', 'ARMA_BLANCA', 'Navaja Albaceteña', 'OPERATIVA', 'LEGAL', 40, NULL),
(7, 'C4-PROF', 'EXPLOSIVO', 'Explosivo Plastico', 'OPERATIVA', 'ILEGAL', 50, NULL),

-- Armas de narcotraficantes
(8, 'UZI-NARCO-01', 'SUBFUSIL', 'Uzi Pro', 'OPERATIVA', 'ILEGAL', 104, NULL),
(9, 'MAC10-01', 'SUBFUSIL', 'MAC-10', 'DETERIORADA', 'ILEGAL', 105, NULL),
(10, 'GLOCK19-01', 'ARMA_DE_FUEGO_CORTA', 'Glock 19', 'OPERATIVA', 'ILEGAL', 106, NULL),

-- Armas violencia de género
(11, 'CUCHILLO-VG01', 'ARMA_BLANCA', 'Cuchillo de cocina 20cm', 'OPERATIVA', 'LEGAL', 108, NULL),

-- Armas banda del taladro
(12, 'TALADRO-IND', 'ARMA_CASERA', 'Taladro Industrial Hilti', 'OPERATIVA', 'LEGAL', 109, NULL),
(13, 'PALANCA-01', 'ARMA_CONTUNDENTE', 'Palanca de acero 60cm', 'OPERATIVA', 'LEGAL', 110, NULL),

-- Armas ajuste de cuentas
(14, 'BERETTA-92', 'ARMA_DE_FUEGO_CORTA', 'Beretta 92FS', 'OPERATIVA', 'ILEGAL', 113, NULL),
(15, 'SILENCIADOR-01', 'ARMA_DE_FUEGO_CORTA', 'Sig Sauer P226 con silenciador', 'NUEVA', 'ILEGAL', NULL, NULL),

-- Armas Rolex Gang
(16, 'TASER-01', 'ARMA_CASERA', 'Taser ilegal modificado', 'OPERATIVA', 'ILEGAL', 119, NULL),
(17, 'SPRAY-01', 'ARMA_CASERA', 'Spray pimienta concentrado', 'OPERATIVA', 'ILEGAL', 120, NULL),

-- Armas trata personas
(18, 'MACHETE-01', 'ARMA_BLANCA', 'Machete 50cm', 'OPERATIVA', 'ILEGAL', 124, NULL),

-- Armas secuestro
(19, 'REVOLVER-38', 'ARMA_DE_FUEGO_CORTA', 'Revolver Smith & Wesson 38', 'DETERIORADA', 'ILEGAL', 128, NULL),

-- Armas ultras
(20, 'BENGALA-01', 'EXPLOSIVO', 'Bengala pirotécnica', 'OPERATIVA', 'ILEGAL', 129, NULL),
(21, 'BATE-01', 'ARMA_CONTUNDENTE', 'Bate de béisbol aluminio', 'OPERATIVA', 'LEGAL', 130, NULL),

-- Armas pirómano
(22, 'MOLOTOV-01', 'EXPLOSIVO', 'Coctel Molotov casero', 'INUTILIZADA', 'ILEGAL', 131, NULL),
(23, 'MECHERO-IND', 'ARMA_CASERA', 'Mechero industrial soplete', 'OPERATIVA', 'LEGAL', 131, NULL),

-- Armas butroneros
(24, 'RADIAL-01', 'ARMA_CASERA', 'Radial corte metal', 'OPERATIVA', 'LEGAL', 140, NULL),
(25, 'SOPLETE-01', 'ARMA_CASERA', 'Soplete acetileno', 'OPERATIVA', 'LEGAL', 141, NULL),

-- Armas terrorismo
(26, 'CHALECO-EXP', 'EXPLOSIVO', 'Chaleco explosivo desactivado', 'INUTILIZADA', 'ILEGAL', NULL, NULL),
(27, 'DETONADOR-01', 'EXPLOSIVO', 'Detonadores electrónicos x5', 'OPERATIVA', 'ILEGAL', 143, NULL),

-- Armas agresor sexual
(28, 'CLOROFORMO-01', 'ARMA_CASERA', 'Sustancia incapacitante', 'OPERATIVA', 'ILEGAL', 139, NULL),

-- Armas decomisadas operaciones
(29, 'AK74-DEC-01', 'AMETRALLADORA', 'AK-74', 'OPERATIVA', 'DECOMISADA', NULL, NULL),
(30, 'M16-DEC-01', 'AMETRALLADORA', 'M16A4', 'OPERATIVA', 'DECOMISADA', NULL, NULL),
(31, 'RPG-DEC-01', 'EXPLOSIVO', 'RPG-7 Lanzagranadas', 'INUTILIZADA', 'DECOMISADA', NULL, NULL),
(32, 'GRANADAS-01', 'EXPLOSIVO', 'Granadas de mano x3', 'INUTILIZADA', 'DECOMISADA', NULL, NULL),

-- Armas policiales reglamentarias
(33, 'CNP-GLOCK-001', 'ARMA_DE_FUEGO_CORTA', 'Glock 17 Gen5 Policia', 'OPERATIVA', 'LEGAL', NULL, NULL),
(34, 'CNP-GLOCK-002', 'ARMA_DE_FUEGO_CORTA', 'Glock 17 Gen5 Policia', 'OPERATIVA', 'LEGAL', NULL, NULL),
(35, 'CNP-HK-001', 'SUBFUSIL', 'HK MP5', 'OPERATIVA', 'LEGAL', NULL, NULL),
(36, 'CNP-HK-002', 'SUBFUSIL', 'HK MP5', 'OPERATIVA', 'LEGAL', NULL, NULL),
(37, 'CNP-ESCOPETA-01', 'ARMA_DE_FUEGO_LARGA', 'Remington 870', 'OPERATIVA', 'LEGAL', NULL, NULL),

-- Armas caza legales
(38, 'CAZA-BERETTA-01', 'ARMA_DE_FUEGO_LARGA', 'Beretta 686 Silver Pigeon', 'BUEN_ESTADO', 'LEGAL', 41, 6),
(39, 'CAZA-BROWNING-01', 'ARMA_DE_FUEGO_LARGA', 'Browning B525', 'OPERATIVA', 'LEGAL', 30, 1),

-- Armas perdidas/robadas
(40, 'PERDIDA-001', 'ARMA_DE_FUEGO_CORTA', 'Colt 1911', 'OPERATIVA', 'PERDIDA', NULL, NULL),
(41, 'ROBADA-001', 'ARMA_DE_FUEGO_CORTA', 'Walther PPK', 'OPERATIVA', 'ROBADA', NULL, NULL),
(42, 'ROBADA-002', 'ARMA_DE_FUEGO_LARGA', 'Rifle Remington 700', 'OPERATIVA', 'ROBADA', NULL, NULL),

-- Armas blancas varias
(43, 'KATANA-01', 'ARMA_BLANCA', 'Katana decorativa afilada', 'OPERATIVA', 'LEGAL', NULL, NULL),
(44, 'PUÑAL-01', 'ARMA_BLANCA', 'Puñal de caza', 'OPERATIVA', 'ILEGAL', 135, NULL),
(45, 'NAVAJA-AUTO-01', 'ARMA_BLANCA', 'Navaja automática', 'OPERATIVA', 'ILEGAL', 136, NULL),

-- Armas contundentes varias
(46, 'PORRA-EXT-01', 'ARMA_CONTUNDENTE', 'Porra extensible', 'OPERATIVA', 'ILEGAL', 137, NULL),
(47, 'MANOPLA-01', 'ARMA_CONTUNDENTE', 'Puño americano', 'OPERATIVA', 'ILEGAL', 157, NULL),
(48, 'CADENA-01', 'ARMA_CONTUNDENTE', 'Cadena con candado', 'OPERATIVA', 'LEGAL', 151, NULL),

-- Armas defectuosas/inutilizadas (evidencias antiguas)
(49, 'DEF-PISTOLA-01', 'ARMA_DE_FUEGO_CORTA', 'Pistola Star 9mm', 'DEFECTUOSA', 'DECOMISADA', NULL, NULL),
(50, 'DEF-REVOLVER-01', 'ARMA_DE_FUEGO_CORTA', 'Revolver Astra', 'INUTILIZADA', 'DECOMISADA', NULL, NULL);

-- -----------------------------------------------------
-- 11. CASOS (AVISOS Y DELITOS) -
-- -----------------------------------------------------

INSERT INTO Aviso (id_aviso, tipoAviso, grado, direccion, fecha, transcripcionLlamada, id_zona, id_unidad, id_emisor) VALUES 
-- CASO 1: PELEA DE TRÁFICO (Original)
(1, 'LLAMADA_EMERGENCIA', 'NARANJA', 'M-30 Salida 12', '2025-05-05 08:30:00', 'Un descapotable se ha cruzado delante de un autobus.', 7, 5, 80),
-- CASO 2: ATRACO FNMT (Original)
(2, 'OPERACION', 'NEGRO', 'Distrito Financiero', '2025-06-01 08:00:00', NULL, 6, 4, 30),

-- CASO 3: ESTAFA PIRAMIDAL (Inspirado Forum Filatélico)
(3, 'DOCUMENTO', 'NARANJA', 'Oficina Central Forum', '2024-01-15 10:00:00', 'Denuncia colectiva por estafa piramidal. Mas de 200 afectados.', 6, 1, 100),
(4, 'LLAMADA', 'VERDE', 'Calle Gran Via 45', '2024-01-16 11:30:00', 'Victima solicita informacion sobre sus ahorros. Muy alterada.', 1, 1, 101),

-- CASO 4: NARCOTRÁFICO ALGECIRAS
(5, 'OPERACION', 'NEGRO', 'Puerto de Algeciras - Muelle 7', '2024-03-20 03:00:00', 'Operacion Centinela. Seguimiento de contenedor sospechoso.', 5, 6, 185),
(6, 'ALARMA', 'ROJO', 'Aguas territoriales - 5mn costa', '2024-03-20 04:30:00', 'Persecucion lanchas rapidas. Solicitan apoyo aereo.', 7, 6, 185),

-- CASO 5: VIOLENCIA DE GÉNERO
(7, 'LLAMADA_EMERGENCIA', 'ROJO', 'Calle Alcala 234, 1B', '2024-05-10 23:45:00', 'Mujer gritando auxilio. Se escuchan golpes. Envien patrulla urgente.', 8, 10, 107),
(8, 'ALARMA_SILENCIOSA', 'ROJO', 'Calle Alcala 234, 1B', '2024-05-11 02:15:00', 'Activacion boton panico victima VG. Orden alejamiento vigente.', 8, 10, 107),

-- CASO 6: BANDA DEL TALADRO
(9, 'ALARMA', 'NARANJA', 'Banco Santander - Calle Mayor 56', '2024-06-15 04:20:00', 'Alarma silenciosa activada. Posible intrusion sotano.', 1, 2, 158),
(10, 'ALARMA', 'NARANJA', 'Caja Rural - Plaza España 12', '2024-06-22 03:45:00', 'Detectados ruidos en muro colindante. Patron similar caso anterior.', 3, 2, 158),
(11, 'ALARMA', 'NARANJA', 'BBVA - Calle Serrano 89', '2024-07-01 04:00:00', 'Tercer robo con modus operandi identico. Banda del taladro activa.', 8, 2, 158),

-- CASO 7: ASESINATO AJUSTE CUENTAS
(12, 'LLAMADA_EMERGENCIA', 'NEGRO', 'Barrio Salamanca - Callejon trasero', '2024-08-05 22:30:00', 'Disparos! Han disparado a un hombre! Esta en el suelo sangrando!', 8, 3, 163),
(13, 'OPERACION', 'NEGRO', 'Hospital La Paz - Urgencias', '2024-08-05 23:15:00', 'Victima tiroteo ingresada. Estado critico. Custodiar habitacion.', 17, 3, 180),

-- CASO 8: PHISHING BANCARIO
(14, 'DOCUMENTO', 'VERDE', 'Comisaria Centro', '2024-09-01 09:00:00', 'Denuncia por fraude bancario online. Phishing.', 1, 1, 115),
(15, 'DOCUMENTO', 'VERDE', 'Comisaria Centro', '2024-09-03 10:30:00', 'Segunda denuncia phishing. Mismo modus operandi.', 1, 1, 116),

-- CASO 9: ATROPELLO Y FUGA
(16, 'LLAMADA_EMERGENCIA', 'ROJO', 'Calle Bravo Murillo cruce Rios Rosas', '2024-10-12 19:45:00', 'Atropello! Una chica joven! El coche se ha dado a la fuga!', 12, 5, 160),
(17, 'LLAMADA', 'NARANJA', 'Poligono Industrial - Nave 12', '2024-10-13 08:00:00', 'Testigo vio coche con daños frontales. Coincide descripcion.', 5, 5, 163),

-- CASO 10: ROLEX GANG
(18, 'LLAMADA_EMERGENCIA', 'NARANJA', 'Hotel Palace - Entrada principal', '2024-11-20 14:30:00', 'Atraco! Dos individuos han robado relojes a turistas!', 1, 1, 121),
(19, 'ALARMA', 'NARANJA', 'Joyeria Ortega y Gasset', '2024-11-25 13:00:00', 'Robo con intimidacion. Patron Rolex Gang.', 8, 10, 121),
(20, 'OPERACION', 'NARANJA', 'Hotel Palace', '2024-11-28 06:00:00', 'Operacion detencion sospechosos Rolex Gang.', 1, 3, 30),

-- CASO 11: TRATA DE PERSONAS
(21, 'OPERACION', 'NEGRO', 'Poligono Marconi', '2024-04-01 05:00:00', 'Operacion Dignidad. Liberacion victimas trata.', 15, 3, 190),
(22, 'LLAMADA', 'ROJO', 'Centro Acogida Municipal', '2024-04-01 08:00:00', 'Testimonio victima. Identifica mas localizaciones.', 1, 6, 122),

-- CASO 12: CORRUPCIÓN URBANÍSTICA
(23, 'DOCUMENTO', 'NARANJA', 'Juzgado Instruccion 5', '2024-02-01 09:00:00', 'Denuncia corrupcion urbanistica. Sobornos concejalias.', 6, 1, 191),
(24, 'OPERACION', 'NARANJA', 'Ayuntamiento - Concejalia Urbanismo', '2024-02-15 07:00:00', 'Registro judicial. Incautacion documentacion.', 1, 14, 191),

-- CASO 13: SECUESTRO EXPRESS
(25, 'LLAMADA_EMERGENCIA', 'NEGRO', 'La Moraleja - Calle Principal', '2024-07-20 08:30:00', 'Han metido a mi mujer en una furgoneta! Secuestro!', 17, 4, 165),
(26, 'LLAMADA', 'NEGRO', 'Numero oculto', '2024-07-20 10:00:00', 'Exigen 50000 euros. Tienen a Patricia. No llamen policia.', 17, 4, 128),
(27, 'OPERACION', 'NEGRO', 'Poligono abandonado Vallecas', '2024-07-20 16:00:00', 'Localizacion victima. Intervencion GEO.', 13, 3, 30),

-- CASO 14: VANDALISMO ESTADIO
(28, 'LLAMADA_EMERGENCIA', 'ROJO', 'Estadio Santiago Bernabeu', '2024-09-15 21:30:00', 'Disturbios grada sur! Bengalas y peleas!', 11, 7, 80),
(29, 'LLAMADA', 'NARANJA', 'Alrededores estadio', '2024-09-15 23:00:00', 'Grupo ultras atacando aficion rival. Varios heridos.', 11, 7, 160),

-- CASO 15: INCENDIO PROVOCADO
(30, 'LLAMADA_EMERGENCIA', 'ROJO', 'Calle del Prado 45-47', '2024-08-25 03:00:00', 'Fuego! El edificio esta ardiendo! Hay gente atrapada!', 3, 9, 34),
(31, 'LLAMADA', 'NARANJA', 'Calle del Prado - Testigo', '2024-08-25 03:30:00', 'Vi a un hombre salir corriendo antes del fuego. Lo reconozco del barrio.', 3, 1, 163),

-- CASO 16: FALSIFICACIÓN DOCUMENTOS
(32, 'OPERACION', 'NARANJA', 'Nave industrial Vallecas', '2024-05-20 06:00:00', 'Operacion Documento. Desmantelamiento taller falsificacion.', 13, 6, 186),
(33, 'DOCUMENTO', 'VERDE', 'Aeropuerto Barajas T4', '2024-05-18 11:00:00', 'Detencion pasaporte falso. Conexion con red mayor.', 17, 15, 30),

-- CASO 17: HURTOS EN COMERCIOS
(34, 'ALARMA', 'VERDE', 'El Corte Ingles - Preciados', '2024-06-01 17:00:00', 'Hurto tecnica distraccion. 3 sospechosos.', 1, 1, 158),
(35, 'ALARMA', 'VERDE', 'Zara - Gran Via', '2024-06-03 18:30:00', 'Hurto coordinado. Mismos individuos que caso anterior.', 1, 1, 158),
(36, 'ALARMA', 'VERDE', 'MediaMarkt - Preciados', '2024-06-05 16:00:00', 'Robo electronica. Banda sudamericana identificada.', 1, 1, 158),

-- CASO 18: AGRESIÓN SEXUAL
(37, 'LLAMADA_EMERGENCIA', 'NEGRO', 'Parque del Retiro - Zona arbolada', '2024-10-05 23:30:00', 'Agresion sexual en curso. Victima pidiendo auxilio.', 8, 3, 138),
(38, 'OPERACION', 'NEGRO', 'Domicilio sospechoso', '2024-10-06 07:00:00', 'Detencion agresor sexual. Coincide descripcion y ADN.', 10, 3, 30),

-- CASO 19: ROBO VIVIENDA BUTRONEROS
(39, 'ALARMA', 'NARANJA', 'Calle Ibiza 56, 4A', '2024-11-10 14:00:00', 'Robo vivienda. Entrada por pared medianera. Joyas y efectivo.', 8, 2, 142),
(40, 'ALARMA', 'NARANJA', 'Calle Ibiza 58, 3B', '2024-11-12 15:30:00', 'Segundo robo mismo edificio. Butron desde vivienda vacia.', 8, 2, 158),

-- CASO 20: VIGILANCIA TERRORISMO
(41, 'OPERACION', 'NEGRO', 'Mezquita M-30', '2024-03-01 00:00:00', 'Vigilancia preventiva. Sospechosos captacion yihadista.', 7, 3, 186),
(42, 'DOCUMENTO', 'NEGRO', 'CNI - Informe clasificado', '2024-04-15 09:00:00', 'Interceptacion comunicaciones. Celula activa.', 6, 3, 186),

-- CASO 21: MALTRATO ANIMAL
(43, 'LLAMADA', 'VERDE', 'Finca Las Encinas - Parcela 7', '2024-07-01 10:00:00', 'Denuncia anonima. Perrera ilegal con animales desnutridos.', 20, 8, 185),
(44, 'OPERACION', 'VERDE', 'Finca Las Encinas', '2024-07-05 08:00:00', 'Intervencion SEPRONA. Rescate 47 animales.', 20, 8, 30),

-- CASO 22: ACCIDENTE LABORAL MORTAL
(45, 'LLAMADA_EMERGENCIA', 'ROJO', 'Obra Paseo de la Castellana 250', '2024-09-20 11:30:00', 'Obrero caido de andamio! No se mueve! Mucha sangre!', 11, 9, 80),
(46, 'DOCUMENTO', 'NARANJA', 'Inspeccion Trabajo', '2024-09-22 09:00:00', 'Informe negligencia seguridad laboral. Falta arneses.', 11, 1, 30),

-- CASO 23: CIBERACOSO MENORES
(47, 'DOCUMENTO', 'NARANJA', 'Comisaria - Delitos Telematicos', '2024-08-01 09:00:00', 'Denuncia padres. Menor acosado redes sociales.', 1, 14, 148),
(48, 'OPERACION', 'NARANJA', 'Domicilio sospechoso - Calle Luna 34', '2024-08-10 07:00:00', 'Detencion grooming. Registro dispositivos electronicos.', 10, 14, 30),

-- CASO 24: OCUPACIÓN ILEGAL
(49, 'LLAMADA', 'VERDE', 'Calle Embajadores 123, 1A', '2024-06-20 18:00:00', 'Anciania llorando. Han ocupado su casa mientras en hospital.', 9, 11, 150),
(50, 'DOCUMENTO', 'VERDE', 'Juzgado', '2024-06-25 10:00:00', 'Orden desalojo okupa. Resistencia esperada.', 9, 11, 150),

-- CASO 25: FRAUDE SEGUROS
(51, 'DOCUMENTO', 'VERDE', 'Aseguradora Mapfre - Investigacion', '2024-04-10 09:00:00', 'Informe fraude. Patron accidentes simulados.', 6, 1, 30),
(52, 'OPERACION', 'VERDE', 'Clinica privada sospechosa', '2024-04-20 08:00:00', 'Registro clinica. Informes medicos falsos.', 11, 1, 30),

-- CASO 26: CONTRABANDO TABACO
(53, 'OPERACION', 'NARANJA', 'Puerto Valencia - Contenedor 234', '2024-05-01 04:00:00', 'Operacion Humo. Inspeccion contenedores sospechosos.', 5, 6, 185),
(54, 'ALARMA', 'NARANJA', 'La Linea - Playa', '2024-05-02 02:00:00', 'Desembarco nocturno. Fardos tabaco.', 5, 6, 185),

-- CASO 27: EXTORSIÓN COMERCIANTES
(55, 'LLAMADA', 'NARANJA', 'Barrio Usera - Restaurante chino', '2024-07-15 22:00:00', 'Empresario asiatico denuncia extorsion. Amenazas muerte.', 15, 11, 156),
(56, 'OPERACION', 'NARANJA', 'Barrio Usera - Redada', '2024-07-25 06:00:00', 'Operacion Dragon. Desarticulacion grupo extorsion.', 15, 6, 30),

-- AVISOS ADICIONALES VARIOS (para completar 100+)
-- Robos con violencia
(57, 'LLAMADA_EMERGENCIA', 'NARANJA', 'Avda Albufera 78', '2024-08-10 21:00:00', 'Me han atracado! Con una navaja! Se han llevado todo!', 13, 12, 159),
(58, 'LLAMADA_EMERGENCIA', 'NARANJA', 'Metro Lavapies - Salida', '2024-08-15 23:30:00', 'Robo con violencia. Grupo de 3 individuos.', 9, 11, 160),

-- Accidentes de tráfico
(59, 'LLAMADA_EMERGENCIA', 'ROJO', 'A-6 km 15', '2024-09-05 07:30:00', 'Colision multiple. 5 vehiculos. Hay heridos.', 7, 5, 80),
(60, 'LLAMADA_EMERGENCIA', 'NARANJA', 'M-40 Salida Vallecas', '2024-09-10 18:00:00', 'Moto caida. Motorista en el suelo.', 7, 5, 163),

-- Peleas y altercados
(61, 'LLAMADA_EMERGENCIA', 'NARANJA', 'Plaza Dos de Mayo - Terraza bar', '2024-06-15 02:00:00', 'Pelea multitudinaria! Botellas volando!', 10, 11, 160),
(62, 'LLAMADA', 'VERDE', 'Discoteca Kapital', '2024-06-20 04:30:00', 'Altercado porteros con clientes. Empujones.', 9, 11, 163),

-- Desaparecidos
(63, 'DOCUMENTO', 'NARANJA', 'Comisaria - Desaparecidos', '2023-08-01 09:00:00', 'Denuncia desaparicion. Joven 25 años. Ultima vez discoteca.', 1, 1, 30),
(64, 'LLAMADA', 'ROJO', 'Familia desesperada', '2023-08-05 20:00:00', 'Sigue sin aparecer. 5 dias. Muy preocupados.', 1, 1, 175),

-- Drogas menudeo
(65, 'LLAMADA', 'VERDE', 'Parque Casino de la Reina', '2024-04-01 16:00:00', 'Trapicheo drogas a plena luz del dia. Menores cerca.', 9, 6, 160),
(66, 'OPERACION', 'VERDE', 'Parque Casino de la Reina', '2024-04-05 17:00:00', 'Operacion antidrogas. Identificacion vendedores.', 9, 6, 30),

-- Ruidos y molestias
(67, 'LLAMADA', 'AZUL', 'Calle Pez 45, 3B', '2024-05-10 03:00:00', 'Fiesta escandalosa. Musica altisima. No dejan dormir.', 10, 11, 34),
(68, 'LLAMADA', 'AZUL', 'Calle Pez 45, 3B', '2024-05-10 04:30:00', 'Sigue el ruido. Tercera llamada.', 10, 11, 34),

-- Hallazgo cadaver
(69, 'LLAMADA_EMERGENCIA', 'NEGRO', 'Rio Manzanares - Puente Toledo', '2024-02-10 07:00:00', 'Hay un cuerpo en el rio! Flotando!', 14, 9, 163),
(70, 'OPERACION', 'NEGRO', 'Instituto Medicina Legal', '2024-02-10 12:00:00', 'Levantamiento cadaver. Sin identificar.', 1, 2, 30),

-- Violencia domestica
(71, 'LLAMADA_EMERGENCIA', 'ROJO', 'Avda Portugal 23, 5B', '2024-07-05 20:00:00', 'Vecina gritando. Ruido de cosas rompiendose.', 14, 13, 164),
(72, 'LLAMADA', 'NARANJA', 'Hospital 12 Octubre', '2024-07-05 22:00:00', 'Victima VD ingresada. Contusiones multiples.', 15, 13, 164),

-- Estafas varias
(73, 'DOCUMENTO', 'VERDE', 'Comisaria', '2024-03-01 10:00:00', 'Estafa inmobiliaria. Piso inexistente.', 1, 1, 161),
(74, 'DOCUMENTO', 'VERDE', 'Comisaria', '2024-03-05 11:00:00', 'Estafa compra online. Producto nunca llego.', 1, 1, 162),

-- Amenazas
(75, 'DOCUMENTO', 'NARANJA', 'Comisaria', '2024-04-20 09:00:00', 'Amenazas de muerte via WhatsApp.', 1, 1, 165),

-- Agresiones
(76, 'LLAMADA_EMERGENCIA', 'NARANJA', 'Calle Fuencarral 134', '2024-05-25 19:00:00', 'Han pegado a una chica! Esta sangrando!', 10, 11, 160),

-- Robo vehiculos
(77, 'DOCUMENTO', 'VERDE', 'Comisaria Salamanca', '2024-06-01 09:00:00', 'Denuncia robo coche. BMW Serie 5.', 8, 10, 159),
(78, 'DOCUMENTO', 'VERDE', 'Comisaria Centro', '2024-06-05 10:00:00', 'Denuncia robo moto. Ducati Monster roja.', 1, 1, 161),
(79, 'DOCUMENTO', 'VERDE', 'Comisaria Salamanca', '2024-06-10 11:00:00', 'Denuncia robo Audi Q7.', 8, 10, 162),
(80, 'DOCUMENTO', 'VERDE', 'Comisaria Centro', '2024-06-15 12:00:00', 'Denuncia robo Mercedes GLC.', 1, 1, 165),

-- Intentos robo
(81, 'ALARMA', 'VERDE', 'Local comercial Hortaleza', '2024-07-01 04:00:00', 'Intento robo frustrado. Alarma los ahuyento.', 17, 1, 158),
(82, 'ALARMA', 'VERDE', 'Farmacia Lavapies', '2024-07-05 03:30:00', 'Rotura cristal escaparate. Sin exito.', 9, 11, 158),

-- Encontrados objetos
(83, 'DOCUMENTO', 'AZUL', 'Comisaria', '2024-04-01 09:00:00', 'Entrega cartera encontrada. DNI y tarjetas.', 1, 1, 163),
(84, 'DOCUMENTO', 'AZUL', 'Comisaria', '2024-04-10 10:00:00', 'Entrega movil encontrado. iPhone.', 1, 1, 160),

-- Suicidio/intento
(85, 'LLAMADA_EMERGENCIA', 'NEGRO', 'Puente de Segovia', '2024-08-15 14:00:00', 'Hombre en la barandilla! Dice que va a saltar!', 14, 4, 163),
(86, 'LLAMADA', 'ROJO', 'Puente de Segovia', '2024-08-15 14:30:00', 'Negociacion en curso. Necesitan apoyo psicologico.', 14, 4, 30),

-- Menores fugados
(87, 'DOCUMENTO', 'NARANJA', 'Comisaria', '2024-05-01 20:00:00', 'Menor 15 años no ha vuelto a casa. 24 horas.', 1, 1, 148),
(88, 'LLAMADA', 'VERDE', 'Centro comercial', '2024-05-02 18:00:00', 'Localizado menor fugado. Sin incidentes.', 1, 1, 148),

-- Venta ambulante ilegal
(89, 'LLAMADA', 'AZUL', 'Paseo del Prado - Museo', '2024-06-01 12:00:00', 'Manteros vendiendo falsificaciones.', 3, 1, 80),
(90, 'OPERACION', 'AZUL', 'Gran Via', '2024-06-05 11:00:00', 'Operacion contra venta ambulante.', 1, 1, 30),

-- Atracos originales (Torrente)
(91, 'LLAMADA_EMERGENCIA', 'NARANJA', 'Supermercado Dia - Vallecas', '2024-01-01 21:00:00', 'Atraco a mano armada! Gordo con pistola grande!', 13, 12, 158),
(92, 'LLAMADA_EMERGENCIA', 'NARANJA', 'Farmacia Guardia - Lavapies', '2024-02-01 02:00:00', 'Robo farmacia! El mismo tipo gordo!', 9, 11, 158),
(93, 'LLAMADA_EMERGENCIA', 'NARANJA', 'Gasolinera Repsol - M30', '2024-03-01 23:00:00', 'Atraco! Pistola enorme! Descripcion coincide serie.', 7, 5, 158),
(94, 'LLAMADA_EMERGENCIA', 'NARANJA', 'Estanco n5 - Centro', '2024-04-01 19:00:00', 'Atracador serie! Otra vez el gordo!', 1, 1, 158),
(95, 'LLAMADA_EMERGENCIA', 'ROJO', 'Joyeria Lujo - Serrano', '2024-05-01 13:00:00', 'Atraco joyeria! Disparos al techo!', 8, 10, 121),
(96, 'LLAMADA_EMERGENCIA', 'ROJO', 'Banco Santander - Gran Via', '2024-06-01 10:30:00', 'Atraco banco! Rehenes dentro!', 1, 3, 158),

-- Mas avisos para variedad
(97, 'LLAMADA', 'VERDE', 'Parque Retiro', '2024-07-10 17:00:00', 'Exhibicionista. Hombre desnudo cerca area infantil.', 8, 10, 160),
(98, 'LLAMADA', 'NARANJA', 'Metro Sol', '2024-07-15 19:00:00', 'Carteristas activos. Turistas denunciando.', 1, 1, 163),
(99, 'DOCUMENTO', 'VERDE', 'Comisaria', '2024-08-01 09:00:00', 'Denuncia injurias redes sociales.', 1, 1, 165),
(100, 'LLAMADA_EMERGENCIA', 'NEGRO', 'Aeropuerto T4 - Zona embarque', '2024-09-01 08:00:00', 'Paquete sospechoso! Evacuen zona!', 17, 15, 80);

-- =====================================================
-- DELITOS (100+ delitos)
-- =====================================================
INSERT INTO Delito (id_delito, codigoTipificacion, descripcion, fecha, estadoProcesal, id_aviso) VALUES 
-- CASO 1: PELEA DE TRÁFICO (Original)
(1, 303, 'Conduccion temeraria y vehiculo sin seguro', '2025-05-05 08:45:00', 'EN_INVESTIGACION', 1),

-- CASO 2: ATRACO FNMT (Original)
(10, 500, 'Atraco mayor cuantia con rehenes', '2025-06-01 08:05:00', 'RESUELTO', 2),

-- CASO 3: SERIE ATRACOS TORRENTE (Original)
(20, 200, 'Atraco Supermercado Dia', '2024-01-01 21:05:00', 'RESUELTO', 91),
(21, 200, 'Atraco Farmacia Guardia', '2024-02-01 02:10:00', 'RESUELTO', 92),
(22, 200, 'Atraco Gasolinera Repsol', '2024-03-01 23:05:00', 'RESUELTO', 93),
(23, 200, 'Atraco Estanco n5', '2024-04-01 19:05:00', 'EN_INVESTIGACION', 94),
(24, 200, 'Atraco Joyeria Lujo', '2024-05-01 13:05:00', 'EN_INVESTIGACION', 95),
(25, 200, 'Atraco Banco Santander', '2024-06-01 10:35:00', 'EN_INVESTIGACION', 96),

-- CASO 4: ESTAFA PIRAMIDAL
(30, 248, 'Estafa piramidal - Desfalco 50 millones euros', '2024-01-15 10:00:00', 'EN_INVESTIGACION', 3),
(31, 248, 'Estafa continuada a jubilados', '2024-01-16 11:30:00', 'EN_INVESTIGACION', 4),

-- CASO 5: NARCOTRÁFICO
(40, 368, 'Trafico drogas - 2 toneladas cocaina', '2024-03-20 03:00:00', 'EN_INVESTIGACION', 5),
(41, 368, 'Trafico drogas - Persecucion maritima', '2024-03-20 04:30:00', 'EN_INVESTIGACION', 6),
(42, 301, 'Blanqueo capitales - Red de yates', '2024-03-25 09:00:00', 'EN_INVESTIGACION', NULL),

-- CASO 6: VIOLENCIA DE GÉNERO
(50, 153, 'Malos tratos habituales en ambito domestico', '2024-05-10 23:45:00', 'RESUELTO', 7),
(51, 468, 'Quebrantamiento orden alejamiento', '2024-05-11 02:15:00', 'RESUELTO', 8),

-- CASO 7: BANDA DEL TALADRO
(60, 238, 'Robo con fuerza - Banco Santander - 120000 EUR', '2024-06-15 04:20:00', 'RESUELTO', 9),
(61, 238, 'Robo con fuerza - Caja Rural - 85000 EUR', '2024-06-22 03:45:00', 'RESUELTO', 10),
(62, 238, 'Robo con fuerza - BBVA - 200000 EUR', '2024-07-01 04:00:00', 'RESUELTO', 11),

-- CASO 8: ASESINATO
(70, 138, 'Asesinato con alevosía - Ajuste cuentas', '2024-08-05 22:30:00', 'EN_INVESTIGACION', 12),

-- CASO 9: PHISHING
(80, 248, 'Estafa informatica - Phishing bancario', '2024-09-01 09:00:00', 'EN_INVESTIGACION', 14),
(81, 248, 'Estafa informatica - Segunda victima', '2024-09-03 10:30:00', 'EN_INVESTIGACION', 15),

-- CASO 10: ATROPELLO Y FUGA
(90, 142, 'Lesiones graves imprudencia - Atropello', '2024-10-12 19:45:00', 'EN_INVESTIGACION', 16),
(91, 195, 'Omision deber socorro', '2024-10-12 19:50:00', 'EN_INVESTIGACION', 16),

-- CASO 11: ROLEX GANG
(100, 242, 'Robo con intimidacion - Hotel Palace', '2024-11-20 14:30:00', 'EN_INVESTIGACION', 18),
(101, 242, 'Robo con intimidacion - Joyeria', '2024-11-25 13:00:00', 'EN_INVESTIGACION', 19),

-- CASO 12: TRATA DE PERSONAS
(110, 177, 'Trata seres humanos - Explotacion sexual', '2024-04-01 05:00:00', 'RESUELTO', 21),
(111, 318, 'Prostitucion forzada', '2024-04-01 08:00:00', 'RESUELTO', 22),

-- CASO 13: CORRUPCIÓN
(120, 419, 'Cohecho - Concejal urbanismo', '2024-02-01 09:00:00', 'EN_INVESTIGACION', 23),
(121, 404, 'Prevaricacion administrativa', '2024-02-15 07:00:00', 'EN_INVESTIGACION', 24),

-- CASO 14: SECUESTRO
(130, 164, 'Secuestro con peticion rescate', '2024-07-20 08:30:00', 'RESUELTO', 25),
(131, 169, 'Extorsion - 50000 EUR exigidos', '2024-07-20 10:00:00', 'RESUELTO', 26),

-- CASO 15: VANDALISMO ESTADIO
(140, 557, 'Desordenes publicos - Estadio futbol', '2024-09-15 21:30:00', 'EN_INVESTIGACION', 28),
(141, 147, 'Lesiones - Agresion ultras', '2024-09-15 23:00:00', 'EN_INVESTIGACION', 29),

-- CASO 16: INCENDIO
(150, 351, 'Incendio provocado - Edificio viviendas', '2024-08-25 03:00:00', 'RESUELTO', 30),
(151, 138, 'Homicidio imprudente - Victima incendio', '2024-08-25 03:30:00', 'RESUELTO', 31),

-- CASO 17: FALSIFICACIÓN
(160, 390, 'Falsificacion documentos - Taller desmantelado', '2024-05-20 06:00:00', 'RESUELTO', 32),
(161, 318, 'Uso documento falso - Aeropuerto', '2024-05-18 11:00:00', 'RESUELTO', 33),

-- CASO 18: HURTOS
(170, 234, 'Hurto - El Corte Ingles', '2024-06-01 17:00:00', 'RESUELTO', 34),
(171, 234, 'Hurto - Zara Gran Via', '2024-06-03 18:30:00', 'RESUELTO', 35),
(172, 234, 'Hurto - MediaMarkt', '2024-06-05 16:00:00', 'RESUELTO', 36),

-- CASO 19: AGRESIÓN SEXUAL
(180, 178, 'Agresion sexual - Parque Retiro', '2024-10-05 23:30:00', 'EN_INVESTIGACION', 37),

-- CASO 20: BUTRONEROS
(190, 238, 'Robo con fuerza vivienda - Tecnica butron', '2024-11-10 14:00:00', 'EN_INVESTIGACION', 39),
(191, 238, 'Robo con fuerza vivienda - Mismo edificio', '2024-11-12 15:30:00', 'EN_INVESTIGACION', 40),

-- CASO 21: TERRORISMO (En investigacion)
(200, 571, 'Pertenencia organizacion terrorista', '2024-03-01 00:00:00', 'EN_INVESTIGACION', 41),
(201, 575, 'Captacion terrorista', '2024-04-15 09:00:00', 'EN_INVESTIGACION', 42),

-- CASO 22: MALTRATO ANIMAL
(210, 337, 'Maltrato animal - Perrera ilegal', '2024-07-01 10:00:00', 'EN_INVESTIGACION', 43),

-- CASO 23: ACCIDENTE LABORAL
(220, 316, 'Homicidio imprudencia grave laboral', '2024-09-20 11:30:00', 'EN_INVESTIGACION', 45),
(221, 316, 'Delito contra seguridad trabajadores', '2024-09-22 09:00:00', 'EN_INVESTIGACION', 46),

-- CASO 24: CIBERACOSO
(230, 197, 'Acoso menores - Grooming', '2024-08-01 09:00:00', 'RESUELTO', 47),
(231, 189, 'Corrupcion menores', '2024-08-10 07:00:00', 'RESUELTO', 48),

-- CASO 25: OCUPACIÓN
(240, 245, 'Usurpacion vivienda habitada', '2024-06-20 18:00:00', 'EN_INVESTIGACION', 49),

-- CASO 26: FRAUDE SEGUROS
(250, 248, 'Estafa aseguradora - Accidentes simulados', '2024-04-10 09:00:00', 'EN_INVESTIGACION', 51),
(251, 390, 'Falsedad documental - Informes medicos', '2024-04-20 08:00:00', 'EN_INVESTIGACION', 52),

-- CASO 27: CONTRABANDO
(260, 368, 'Contrabando tabaco - 500000 cajetillas', '2024-05-01 04:00:00', 'EN_INVESTIGACION', 53),

-- CASO 28: EXTORSIÓN
(270, 243, 'Extorsion a comerciantes', '2024-07-15 22:00:00', 'RESUELTO', 55),
(271, 515, 'Asociacion ilicita - Mafia china', '2024-07-25 06:00:00', 'RESUELTO', 56),

-- DELITOS ADICIONALES
(280, 242, 'Robo con violencia - Calle', '2024-08-10 21:00:00', 'EN_INVESTIGACION', 57),
(281, 242, 'Robo con violencia - Metro', '2024-08-15 23:30:00', 'EN_INVESTIGACION', 58),

-- Lesiones trafico
(290, 152, 'Lesiones por accidente trafico multiple', '2024-09-05 07:30:00', 'EN_INVESTIGACION', 59),

-- Desordenes
(300, 557, 'Desordenes publicos - Botellon', '2024-06-15 02:00:00', 'ARCHIVADO', 61),

-- Cadaver sin identificar
(310, 138, 'Homicidio - Cadaver rio Manzanares', '2024-02-10 07:00:00', 'EN_INVESTIGACION', 69),

-- Violencia domestica
(320, 153, 'Maltrato domestico', '2024-07-05 20:00:00', 'EN_INVESTIGACION', 71),

-- Estafas menores
(330, 248, 'Estafa inmobiliaria', '2024-03-01 10:00:00', 'EN_INVESTIGACION', 73),
(331, 248, 'Estafa online', '2024-03-05 11:00:00', 'ARCHIVADO', 74),

-- Amenazas
(340, 169, 'Amenazas muerte', '2024-04-20 09:00:00', 'EN_INVESTIGACION', 75),

-- Lesiones
(350, 147, 'Lesiones - Agresion callejera', '2024-05-25 19:00:00', 'EN_INVESTIGACION', 76),

-- Robos vehiculos
(360, 244, 'Robo vehiculo - BMW', '2024-06-01 09:00:00', 'EN_INVESTIGACION', 77),
(361, 244, 'Robo vehiculo - Ducati', '2024-06-05 10:00:00', 'EN_INVESTIGACION', 78),
(362, 244, 'Robo vehiculo - Audi Q7', '2024-06-10 11:00:00', 'EN_INVESTIGACION', 79),
(363, 244, 'Robo vehiculo - Mercedes GLC', '2024-06-15 12:00:00', 'EN_INVESTIGACION', 80),

-- Tentativas
(370, 234, 'Tentativa robo - Local Hortaleza', '2024-07-01 04:00:00', 'ARCHIVADO', 81),
(371, 234, 'Tentativa robo - Farmacia', '2024-07-05 03:30:00', 'ARCHIVADO', 82),

-- Suicidio
(380, 143, 'Induccion al suicidio (descartado)', '2024-08-15 14:00:00', 'ARCHIVADO', 85),

-- Exhibicionismo
(390, 185, 'Exhibicionismo', '2024-07-10 17:00:00', 'PENDIENTE', 97),

-- Hurtos menores
(400, 234, 'Hurto carteristas', '2024-07-15 19:00:00', 'PENDIENTE', 98),

-- Paquete sospechoso (falsa alarma)
(410, 561, 'Falsa amenaza bomba (descartado)', '2024-09-01 08:00:00', 'ARCHIVADO', 100);

-- -----------------------------------------------------
-- 12. EVIDENCIAS
-- -----------------------------------------------------
INSERT INTO Evidencia (id_evidencia, tipo, descripcion, estado, lugar, id_delito, id_arma) VALUES 
-- CASO 1: Pelea tráfico
(1, 'DOCUMENTAL', 'Multa por falta de seguro obligatorio', 'ANALIZADA', 'M-30 Salida 12', 1, NULL),
(2, 'DIGITAL', 'Video grabacion dashcam autobus', 'ANALIZADA', 'Deposito Autobus EMT', 1, NULL),

-- CASO 2: FNMT
(3, 'FISICA', 'Fusil de asalto sovietico AK-47', 'ANALIZADA', 'FNMT - Sala de bóvedas', 10, 5),
(4, 'FISICA', 'Mascara Dali nº1', 'ANALIZADA', 'FNMT - Entrada principal', 10, NULL),
(5, 'FISICA', 'Mascara Dali nº2', 'ANALIZADA', 'FNMT - Entrada principal', 10, NULL),
(6, 'BIOLOGICA', 'Muestra ADN - pelo', 'ANALIZADA', 'FNMT - Despacho director', 10, NULL),
(7, 'DIGITAL', 'Grabacion camaras seguridad 72h', 'ANALIZADA', 'FNMT - Centro control', 10, NULL),

-- Serie Torrente (20-25)
(10, 'FISICA', 'Casquillo bala calibre 44 - Dia', 'ANALIZADA', 'Supermercado Dia Vallecas', 20, 4),
(11, 'FISICA', 'Casquillo bala calibre 44 - Farmacia', 'ANALIZADA', 'Farmacia Guardia Lavapies', 21, 4),
(12, 'FISICA', 'Casquillo bala calibre 44 - Gasolinera', 'ANALIZADA', 'Gasolinera Repsol M30', 22, 4),
(13, 'FISICA', 'Casquillo bala calibre 44 - Estanco', 'EN_CUSTODIA', 'Estanco n5 Centro', 23, 4),
(14, 'FISICA', 'Casquillo bala calibre 44 - Joyeria', 'EN_CUSTODIA', 'Joyeria Lujo Serrano', 24, 4),
(15, 'FISICA', 'Casquillo bala calibre 44 - Banco', 'EN_CUSTODIA', 'Banco Santander Gran Via', 25, 4),
(16, 'DIGITAL', 'Video seguridad Supermercado', 'ANALIZADA', 'Supermercado Dia', 20, NULL),
(17, 'DIGITAL', 'Video seguridad Farmacia', 'ANALIZADA', 'Farmacia Guardia', 21, NULL),
(18, 'TESTIMONIAL', 'Declaracion cajera - identificacion', 'ANALIZADA', 'Comisaria Centro', 20, NULL),

-- Estafa piramidal (30-31)
(20, 'DOCUMENTAL', 'Contratos fraudulentos - 500 documentos', 'EN_ANALISIS', 'Oficina Forum', 30, NULL),
(21, 'DOCUMENTAL', 'Extractos bancarios sospechosos', 'EN_ANALISIS', 'Banco - Cuentas empresa', 30, NULL),
(22, 'DIGITAL', 'Disco duro servidor empresa', 'EN_ANALISIS', 'Oficina Forum - CPD', 30, NULL),
(23, 'TESTIMONIAL', 'Declaracion victima Manuel Fernandez', 'ANALIZADA', 'Comisaria', 31, NULL),
(24, 'DOCUMENTAL', 'Recibos pagos victimas', 'ANALIZADA', 'Domicilio victimas', 31, NULL),

-- Narcotráfico (40-42)
(30, 'FISICA', 'Fardos cocaina - 2000kg', 'ANALIZADA', 'Puerto Algeciras - Muelle 7', 40, NULL),
(31, 'FISICA', 'Lancha rapida incautada', 'EN_CUSTODIA', 'Puerto Algeciras', 41, NULL),
(32, 'FISICA', 'Subfusil Uzi', 'ANALIZADA', 'Lancha rapida', 41, 8),
(33, 'DOCUMENTAL', 'Documentacion falsa barco', 'ANALIZADA', 'Contenedor 47', 40, NULL),
(34, 'DIGITAL', 'Telefono satelital encriptado', 'EN_ANALISIS', 'Detenido Mohamed', 40, NULL),
(35, 'BIOLOGICA', 'Huellas dactilares fardos', 'ANALIZADA', 'Laboratorio', 40, NULL),
(36, 'DOCUMENTAL', 'Escrituras yates - blanqueo', 'EN_ANALISIS', 'Registro Propiedad', 42, NULL),

-- Violencia género (50-51)
(40, 'FISICA', 'Cuchillo ensangrentado', 'ANALIZADA', 'Domicilio victima', 50, 11),
(41, 'BIOLOGICA', 'Muestra sangre victima', 'ANALIZADA', 'Hospital', 50, NULL),
(42, 'DIGITAL', 'Mensajes amenazantes WhatsApp', 'ANALIZADA', 'Movil victima', 51, NULL),
(43, 'DOCUMENTAL', 'Orden alejamiento quebrantada', 'ANALIZADA', 'Juzgado', 51, NULL),
(44, 'TESTIMONIAL', 'Declaracion vecinos - gritos', 'ANALIZADA', 'Comisaria', 50, NULL),

-- Banda taladro (60-62)
(50, 'FISICA', 'Taladro industrial Hilti', 'ANALIZADA', 'Furgoneta banda', 60, 12),
(51, 'FISICA', 'Fragmentos hormigon - butrón', 'ANALIZADA', 'Banco Santander sotano', 60, NULL),
(52, 'FISICA', 'Guantes latex con huellas', 'ANALIZADA', 'Caja Rural', 61, NULL),
(53, 'DIGITAL', 'Video camaras internas', 'ANALIZADA', 'BBVA', 62, NULL),
(54, 'BIOLOGICA', 'ADN en colilla abandonada', 'ANALIZADA', 'Escena BBVA', 62, NULL),
(55, 'FISICA', 'Palanca de acero', 'ANALIZADA', 'Furgoneta banda', 60, 13),
(56, 'DOCUMENTAL', 'Planos edificio robados', 'ANALIZADA', 'Domicilio sospechoso', 62, NULL),

-- Asesinato (70)
(60, 'FISICA', 'Casquillos 9mm x3', 'EN_CUSTODIA', 'Callejon Salamanca', 70, NULL),
(61, 'FISICA', 'Pistola Beretta 92FS', 'EN_ANALISIS', 'Registrada por informante', 70, 14),
(62, 'BIOLOGICA', 'Sangre victima - charco', 'ANALIZADA', 'Escena crimen', 70, NULL),
(63, 'BIOLOGICA', 'ADN bajo uñas victima', 'EN_ANALISIS', 'Autopsia', 70, NULL),
(64, 'DIGITAL', 'Camaras trafico zona', 'EN_ANALISIS', 'Centro Control Trafico', 70, NULL),
(65, 'TESTIMONIAL', 'Declaracion testigo Oscar Martin', 'ANALIZADA', 'Comisaria', 70, NULL),

-- Phishing (80-81)
(70, 'DIGITAL', 'Correos phishing originales', 'ANALIZADA', 'Servidor email victimas', 80, NULL),
(71, 'DIGITAL', 'IP origen ataques', 'EN_ANALISIS', 'Logs servidor', 80, NULL),
(72, 'DOCUMENTAL', 'Movimientos bancarios fraudulentos', 'ANALIZADA', 'Banco', 81, NULL),
(73, 'DIGITAL', 'Pagina web clonada - capturas', 'ANALIZADA', 'Analisis forense', 80, NULL),

-- Atropello (90-91)
(80, 'FISICA', 'Fragmentos plastico faro', 'ANALIZADA', 'Escena atropello', 90, NULL),
(81, 'FISICA', 'Fibras ropa victima en coche', 'ANALIZADA', 'Vehiculo sospechoso', 90, NULL),
(82, 'BIOLOGICA', 'Sangre en parachoques', 'ANALIZADA', 'Vehiculo sospechoso', 90, NULL),
(83, 'DIGITAL', 'Camaras trafico - huida', 'ANALIZADA', 'Centro Control', 90, NULL),
(84, 'TESTIMONIAL', 'Declaracion testigo huida', 'ANALIZADA', 'Comisaria', 91, NULL),
(85, 'DOCUMENTAL', 'Test alcoholemia positivo', 'ANALIZADA', 'Detencion', 91, NULL),

-- Rolex Gang (100-101)
(90, 'FISICA', 'Taser ilegal modificado', 'ANALIZADA', 'Habitacion hotel', 100, 16),
(91, 'FISICA', 'Spray pimienta', 'ANALIZADA', 'Habitacion hotel', 100, 17),
(92, 'FISICA', 'Relojes robados x12', 'EN_CUSTODIA', 'Habitacion hotel', 101, NULL),
(93, 'DIGITAL', 'Video seguridad hotel', 'ANALIZADA', 'Hotel Palace', 100, NULL),
(94, 'DOCUMENTAL', 'Pasaportes falsos rusos', 'ANALIZADA', 'Equipaje sospechosos', 101, NULL),

-- Trata (110-111)
(100, 'TESTIMONIAL', 'Declaracion victima Fatima', 'ANALIZADA', 'Centro Acogida', 110, NULL),
(101, 'TESTIMONIAL', 'Declaracion victima Blessing', 'ANALIZADA', 'Centro Acogida', 110, NULL),
(102, 'FISICA', 'Machete amenazas', 'ANALIZADA', 'Local Marconi', 110, 18),
(103, 'DIGITAL', 'Moviles con conversaciones', 'ANALIZADA', 'Detenidos', 111, NULL),
(104, 'DOCUMENTAL', 'Documentacion falsa victimas', 'ANALIZADA', 'Local Marconi', 111, NULL),

-- Corrupcion (120-121)
(110, 'DOCUMENTAL', 'Contratos amañados', 'EN_ANALISIS', 'Ayuntamiento', 120, NULL),
(111, 'DOCUMENTAL', 'Transferencias sospechosas', 'EN_ANALISIS', 'Cuentas Suiza', 120, NULL),
(112, 'DIGITAL', 'Correos electronicosincriminatorios', 'EN_ANALISIS', 'Servidor Ayuntamiento', 121, NULL),
(113, 'TESTIMONIAL', 'Declaracion testigo protegido', 'ANALIZADA', 'Juzgado', 121, NULL),

-- Secuestro (130-131)
(120, 'FISICA', 'Furgoneta secuestro', 'ANALIZADA', 'Poligono Vallecas', 130, NULL),
(121, 'FISICA', 'Cuerdas y mordaza', 'ANALIZADA', 'Nave abandona', 130, NULL),
(122, 'FISICA', 'Revolver 38', 'ANALIZADA', 'Detenido', 131, 19),
(123, 'DIGITAL', 'Grabacion llamada rescate', 'ANALIZADA', 'Telefono familia', 131, NULL),
(124, 'BIOLOGICA', 'ADN en cuerda', 'ANALIZADA', 'Laboratorio', 130, NULL),

-- Vandalismo estadio (140-141)
(130, 'FISICA', 'Bengalas pirotecnicas', 'ANALIZADA', 'Grada Sur', 140, 20),
(131, 'FISICA', 'Bate de beisbol', 'ANALIZADA', 'Detenido', 141, 21),
(132, 'DIGITAL', 'Video camaras estadio', 'ANALIZADA', 'Centro control', 140, NULL),
(133, 'BIOLOGICA', 'ADN en botella rota', 'ANALIZADA', 'Escena', 141, NULL),
(134, 'TESTIMONIAL', 'Declaracion heridos', 'ANALIZADA', 'Hospital', 141, NULL),

-- Incendio (150-151)
(140, 'FISICA', 'Restos coctel molotov', 'ANALIZADA', 'Escena incendio', 150, 22),
(141, 'FISICA', 'Mechero industrial', 'ANALIZADA', 'Domicilio sospechoso', 150, 23),
(142, 'DIGITAL', 'Camaras edificio colindante', 'ANALIZADA', 'Edificio 43', 150, NULL),
(143, 'TESTIMONIAL', 'Declaracion testigo - huida', 'ANALIZADA', 'Comisaria', 150, NULL),
(144, 'DOCUMENTAL', 'Informe bomberos - origen', 'ANALIZADA', 'Parque bomberos', 151, NULL),

-- Falsificacion (160-161)
(150, 'FISICA', 'Impresora industrial', 'ANALIZADA', 'Nave Vallecas', 160, NULL),
(151, 'FISICA', 'Pasaportes falsos x200', 'ANALIZADA', 'Nave Vallecas', 160, NULL),
(152, 'FISICA', 'DNI falsos x150', 'ANALIZADA', 'Nave Vallecas', 160, NULL),
(153, 'FISICA', 'Pasaporte falso aeropuerto', 'ANALIZADA', 'Aeropuerto T4', 161, NULL),
(154, 'DIGITAL', 'Ordenadores con plantillas', 'EN_ANALISIS', 'Nave Vallecas', 160, NULL),

-- Hurtos (170-172)
(160, 'DIGITAL', 'Video seguridad Corte Ingles', 'ANALIZADA', 'Centro comercial', 170, NULL),
(161, 'DIGITAL', 'Video seguridad Zara', 'ANALIZADA', 'Gran Via', 171, NULL),
(162, 'FISICA', 'Ropa robada recuperada', 'ANALIZADA', 'Detencion', 170, NULL),
(163, 'FISICA', 'Electronica robada', 'EN_CUSTODIA', 'Albergue', 172, NULL),

-- Agresion sexual (180)
(170, 'BIOLOGICA', 'Kit agresion sexual', 'EN_ANALISIS', 'Hospital', 180, NULL),
(171, 'FISICA', 'Ropa victima desgarrada', 'ANALIZADA', 'Escena', 180, NULL),
(172, 'BIOLOGICA', 'ADN agresor', 'ANALIZADA', 'Laboratorio', 180, NULL),
(173, 'DIGITAL', 'Localizacion GPS movil agresor', 'ANALIZADA', 'Analisis forense', 180, NULL),
(174, 'FISICA', 'Sustancia incapacitante', 'ANALIZADA', 'Escena', 180, 28),

-- Butroneros (190-191)
(180, 'FISICA', 'Radial corte metal', 'ANALIZADA', 'Furgoneta', 190, 24),
(181, 'FISICA', 'Soplete acetileno', 'ANALIZADA', 'Furgoneta', 190, 25),
(182, 'FISICA', 'Joyas robadas - parcial', 'EN_CUSTODIA', 'Casa empeño', 191, NULL),
(183, 'DIGITAL', 'Inhibidor alarmas', 'ANALIZADA', 'Furgoneta', 191, NULL),

-- Terrorismo (200-201)
(190, 'DIGITAL', 'Comunicaciones encriptadas', 'EN_ANALISIS', 'Moviles incautados', 200, NULL),
(191, 'DIGITAL', 'Material propaganda yihadista', 'ANALIZADA', 'Ordenador sospechoso', 201, NULL),
(192, 'FISICA', 'Chaleco explosivo desactivado', 'ANALIZADA', 'Zulo', 200, 26),
(193, 'FISICA', 'Detonadores electronicos', 'ANALIZADA', 'Zulo', 200, 27),
(194, 'TESTIMONIAL', 'Informe CNI clasificado', 'ANALIZADA', 'CNI', 201, NULL),

-- Maltrato animal (210)
(200, 'DIGITAL', 'Fotos animales desnutridos', 'ANALIZADA', 'Movil denunciante', 210, NULL),
(201, 'DOCUMENTAL', 'Informe veterinario', 'ANALIZADA', 'Centro rescate', 210, NULL),
(202, 'TESTIMONIAL', 'Declaracion SEPRONA', 'ANALIZADA', 'Comisaria', 210, NULL),

-- Accidente laboral (220-221)
(210, 'FISICA', 'Arnes defectuoso', 'ANALIZADA', 'Escena accidente', 220, NULL),
(211, 'DOCUMENTAL', 'Libro registro seguridad', 'ANALIZADA', 'Oficina obra', 221, NULL),
(212, 'DOCUMENTAL', 'Contratos irregulares', 'EN_ANALISIS', 'Empresa', 221, NULL),
(213, 'TESTIMONIAL', 'Declaracion compañeros', 'ANALIZADA', 'Comisaria', 220, NULL),
(214, 'DIGITAL', 'Fotos condiciones inseguras', 'ANALIZADA', 'Movil testigo', 221, NULL),

-- Ciberacoso (230-231)
(220, 'DIGITAL', 'Conversaciones WhatsApp', 'ANALIZADA', 'Movil menor', 230, NULL),
(221, 'DIGITAL', 'Perfil falso Instagram', 'ANALIZADA', 'Capturas pantalla', 230, NULL),
(222, 'DIGITAL', 'Disco duro agresor', 'ANALIZADA', 'Domicilio detenido', 231, NULL),
(223, 'DIGITAL', 'Material pornografico menores', 'ANALIZADA', 'Disco duro', 231, NULL),

-- Ocupacion (240)
(230, 'DOCUMENTAL', 'Escritura propiedad', 'ANALIZADA', 'Registro', 240, NULL),
(231, 'TESTIMONIAL', 'Declaracion vecinos', 'ANALIZADA', 'Comisaria', 240, NULL),
(232, 'DIGITAL', 'Video momento ocupacion', 'ANALIZADA', 'Camara portal', 240, NULL),

-- Fraude seguros (250-251)
(240, 'DOCUMENTAL', 'Partes accidente falsos', 'EN_ANALISIS', 'Aseguradora', 250, NULL),
(241, 'DOCUMENTAL', 'Informes medicos falsos', 'EN_ANALISIS', 'Clinica', 251, NULL),
(242, 'DIGITAL', 'Correos coordinacion fraude', 'ANALIZADA', 'Servidor clinica', 251, NULL),

-- Contrabando (260)
(250, 'FISICA', 'Cajetillas tabaco x500000', 'EN_CUSTODIA', 'Contenedor 234', 260, NULL),
(251, 'DOCUMENTAL', 'Documentacion falsa carga', 'ANALIZADA', 'Contenedor', 260, NULL),
(252, 'DIGITAL', 'GPS seguimiento camion', 'ANALIZADA', 'Vehiculo', 260, NULL),

-- Extorsion (270-271)
(260, 'DIGITAL', 'Grabacion amenazas', 'ANALIZADA', 'Movil victima', 270, NULL),
(261, 'FISICA', 'Puño americano', 'ANALIZADA', 'Detenido', 271, 47),
(262, 'DOCUMENTAL', 'Transferencias extorsion', 'ANALIZADA', 'Banco', 270, NULL),
(263, 'TESTIMONIAL', 'Declaracion victima Li Chen', 'ANALIZADA', 'Comisaria', 270, NULL),

-- Robos violencia (280-281)
(270, 'FISICA', 'Navaja automatica', 'ANALIZADA', 'Detenido', 280, 45),
(271, 'DIGITAL', 'Camaras metro', 'ANALIZADA', 'Metro', 281, NULL),
(272, 'BIOLOGICA', 'ADN en navaja', 'ANALIZADA', 'Laboratorio', 280, NULL),

-- Cadaver rio (310)
(280, 'BIOLOGICA', 'Muestras ADN cadaver', 'EN_ANALISIS', 'Autopsia', 310, NULL),
(281, 'FISICA', 'Ropa victima', 'ANALIZADA', 'Autopsia', 310, NULL),
(282, 'DOCUMENTAL', 'Informe autopsia', 'ANALIZADA', 'Medicina Legal', 310, NULL),

-- Violencia domestica (320)
(290, 'BIOLOGICA', 'Kit lesiones', 'ANALIZADA', 'Hospital', 320, NULL),
(291, 'DIGITAL', 'Mensajes amenazantes', 'ANALIZADA', 'Movil victima', 320, NULL),
(292, 'TESTIMONIAL', 'Declaracion vecinos', 'ANALIZADA', 'Comisaria', 320, NULL),

-- Robos vehiculos (360-363)
(300, 'DOCUMENTAL', 'Denuncia robo BMW', 'ANALIZADA', 'Comisaria', 360, NULL),
(301, 'DOCUMENTAL', 'Denuncia robo Ducati', 'ANALIZADA', 'Comisaria', 361, NULL),
(302, 'DOCUMENTAL', 'Denuncia robo Audi', 'ANALIZADA', 'Comisaria', 362, NULL),
(303, 'DOCUMENTAL', 'Denuncia robo Mercedes', 'ANALIZADA', 'Comisaria', 363, NULL),
(304, 'DIGITAL', 'Camaras zona robo BMW', 'EN_ANALISIS', 'Centro control', 360, NULL);

-- -----------------------------------------------------
-- 12B. MULTIMEDIA 
-- -----------------------------------------------------
INSERT INTO Multimedia (id_multimedia, extension, url, descripcion, id_persona_foto, id_persona_huella, id_aviso, id_evidencia) VALUES 
-- Fotos policiales (fichados)
(1, 'jpg', 'https://policia.es/fichas/torrente_joseLuis.jpg', 'Foto ficha policial - Jose Luis Torrente', 60, NULL, NULL, NULL),
(2, 'jpg', 'https://policia.es/fichas/profesor.jpg', 'Foto ficha policial - El Profesor', 50, NULL, NULL, NULL),
(3, 'jpg', 'https://policia.es/fichas/berlin.jpg', 'Foto ficha policial - Berlin', 51, NULL, NULL, NULL),
(4, 'jpg', 'https://policia.es/fichas/tokio.jpg', 'Foto ficha policial - Tokio', 52, NULL, NULL, NULL),
(5, 'jpg', 'https://policia.es/fichas/rio.jpg', 'Foto ficha policial - Rio', 53, NULL, NULL, NULL),
(6, 'jpg', 'https://policia.es/fichas/makelele.jpg', 'Foto ficha policial - El Makelele', 61, NULL, NULL, NULL),
(7, 'jpg', 'https://policia.es/fichas/santi_millaMierda.jpg', 'Foto ficha policial - Santi Millán', 62, NULL, NULL, NULL),
(8, 'jpg', 'https://policia.es/fichas/narco_hamid.jpg', 'Foto ficha policial - Hamid Laroussi', 65, NULL, NULL, NULL),
(9, 'jpg', 'https://policia.es/fichas/narco_mohamed.jpg', 'Foto ficha policial - Mohamed El Kassmi', 66, NULL, NULL, NULL),
(10, 'jpg', 'https://policia.es/fichas/taladro_andrei.jpg', 'Foto ficha policial - Andrei Popescu', 68, NULL, NULL, NULL),

-- Huellas dactilares
(11, 'png', 'https://policia.es/huellas/torrente_derecha.png', 'Huella dactilar mano derecha - Torrente', NULL, 60, NULL, NULL),
(12, 'png', 'https://policia.es/huellas/profesor_derecha.png', 'Huella dactilar mano derecha - Profesor', NULL, 50, NULL, NULL),
(13, 'png', 'https://policia.es/huellas/berlin_derecha.png', 'Huella dactilar mano derecha - Berlin', NULL, 51, NULL, NULL),
(14, 'png', 'https://policia.es/huellas/tokio_derecha.png', 'Huella dactilar mano derecha - Tokio', NULL, 52, NULL, NULL),
(15, 'png', 'https://policia.es/huellas/hamid_derecha.png', 'Huella dactilar mano derecha - Hamid', NULL, 65, NULL, NULL),
(16, 'png', 'https://policia.es/huellas/mohamed_derecha.png', 'Huella dactilar mano derecha - Mohamed', NULL, 66, NULL, NULL),
(17, 'png', 'https://policia.es/huellas/taladro_andrei.png', 'Huella dactilar mano derecha - Andrei', NULL, 68, NULL, NULL),
(18, 'png', 'https://policia.es/huellas/taladro_bogdan.png', 'Huella dactilar mano derecha - Bogdan', NULL, 69, NULL, NULL),

-- Documentos avisos/operaciones
(20, 'pdf', 'https://policia.es/avisos/operacion_dinero_papel.pdf', 'Plan operativo Casa de Papel', NULL, NULL, 10, NULL),
(21, 'pdf', 'https://policia.es/avisos/operacion_taladro.pdf', 'Plan operativo Banda Taladro', NULL, NULL, 20, NULL),
(22, 'pdf', 'https://policia.es/avisos/operacion_narcos_sur.pdf', 'Plan operativo Narcos del Sur', NULL, NULL, 30, NULL),
(23, 'pdf', 'https://policia.es/avisos/operacion_rolex.pdf', 'Plan operativo Rolex Gang', NULL, NULL, 40, NULL),
(24, 'pdf', 'https://policia.es/avisos/operacion_trata.pdf', 'Plan operativo Trata personas', NULL, NULL, 50, NULL),
(25, 'pdf', 'https://policia.es/avisos/informe_terrorismo.pdf', 'Informe coordinacion antiterrorista', NULL, NULL, 60, NULL),

-- Audios llamadas emergencia
(30, 'mp3', 'https://policia.es/audio/112_llamada_20240115_001.mp3', 'Llamada 112 - Pelea trafico', NULL, NULL, 1, NULL),
(31, 'mp3', 'https://policia.es/audio/112_llamada_atraco_dia.mp3', 'Llamada 112 - Atraco supermercado', NULL, NULL, 5, NULL),
(32, 'mp3', 'https://policia.es/audio/112_llamada_violencia_genero.mp3', 'Llamada 112 - Violencia de genero', NULL, NULL, 15, NULL),
(33, 'mp3', 'https://policia.es/audio/112_llamada_incendio.mp3', 'Llamada 112 - Incendio intencionado', NULL, NULL, 70, NULL),
(34, 'mp3', 'https://policia.es/audio/112_llamada_secuestro.mp3', 'Llamada rescate secuestro', NULL, NULL, 45, NULL),
(35, 'mp3', 'https://policia.es/audio/112_llamada_estadio.mp3', 'Llamada emergencias estadio', NULL, NULL, 75, NULL),

-- Videos evidencias
(40, 'mp4', 'https://policia.es/evidencias/video_dashcam_pelea.mp4', 'Video dashcam accidente trafico', NULL, NULL, NULL, 2),
(41, 'mp4', 'https://policia.es/evidencias/video_fnmt_entrada.mp4', 'Camaras FNMT entrada banda', NULL, NULL, NULL, 7),
(42, 'mp4', 'https://policia.es/evidencias/video_atraco_dia.mp4', 'Video seguridad Supermercado', NULL, NULL, NULL, 16),
(43, 'mp4', 'https://policia.es/evidencias/video_atraco_farmacia.mp4', 'Video seguridad Farmacia', NULL, NULL, NULL, 17),
(44, 'mp4', 'https://policia.es/evidencias/video_puerto_descarga.mp4', 'Video descarga cocaina puerto', NULL, NULL, NULL, 30),
(45, 'mp4', 'https://policia.es/evidencias/video_butron_bbva.mp4', 'Video camaras internas BBVA', NULL, NULL, NULL, 53),
(46, 'mp4', 'https://policia.es/evidencias/video_hotel_rolex.mp4', 'Video seguridad Hotel Palace', NULL, NULL, NULL, 93),
(47, 'mp4', 'https://policia.es/evidencias/video_estadio_ultras.mp4', 'Video camaras estadio', NULL, NULL, NULL, 132),
(48, 'mp4', 'https://policia.es/evidencias/video_atropello_huida.mp4', 'Video camaras trafico huida', NULL, NULL, NULL, 83),
(49, 'mp4', 'https://policia.es/evidencias/video_metro_robo.mp4', 'Video camaras metro', NULL, NULL, NULL, 271),

-- Fotos evidencias fisicas
(50, 'jpg', 'https://policia.es/evidencias/foto_ak47.jpg', 'Foto AK-47 escena', NULL, NULL, NULL, 3),
(51, 'jpg', 'https://policia.es/evidencias/foto_mascara_dali_1.jpg', 'Foto mascara Dali 1', NULL, NULL, NULL, 4),
(52, 'jpg', 'https://policia.es/evidencias/foto_mascara_dali_2.jpg', 'Foto mascara Dali 2', NULL, NULL, NULL, 5),
(53, 'jpg', 'https://policia.es/evidencias/foto_cocaina_fardos.jpg', 'Foto fardos cocaina', NULL, NULL, NULL, 30),
(54, 'jpg', 'https://policia.es/evidencias/foto_lancha_narcos.jpg', 'Foto lancha interceptada', NULL, NULL, NULL, 31),
(55, 'jpg', 'https://policia.es/evidencias/foto_taladro_industrial.jpg', 'Foto taladro Hilti', NULL, NULL, NULL, 50),
(56, 'jpg', 'https://policia.es/evidencias/foto_butron.jpg', 'Foto butron banco', NULL, NULL, NULL, 51),
(57, 'jpg', 'https://policia.es/evidencias/foto_taser.jpg', 'Foto taser ilegal', NULL, NULL, NULL, 90),
(58, 'jpg', 'https://policia.es/evidencias/foto_relojes_robados.jpg', 'Foto relojes recuperados', NULL, NULL, NULL, 92),
(59, 'jpg', 'https://policia.es/evidencias/foto_chaleco_explosivo.jpg', 'Foto chaleco explosivo', NULL, NULL, NULL, 192),

-- Fotos escenas crimenes
(60, 'jpg', 'https://policia.es/escenas/escena_asesinato_salamanca.jpg', 'Foto escena asesinato callejon', NULL, NULL, NULL, 60),
(61, 'jpg', 'https://policia.es/escenas/escena_incendio_nave.jpg', 'Foto nave incendiada', NULL, NULL, NULL, 140),
(62, 'jpg', 'https://policia.es/escenas/escena_furgoneta_secuestro.jpg', 'Foto furgoneta secuestro', NULL, NULL, NULL, 120),
(63, 'jpg', 'https://policia.es/escenas/escena_atropello.jpg', 'Foto escena atropello', NULL, NULL, NULL, 80),
(64, 'jpg', 'https://policia.es/escenas/escena_cadaver_rio.jpg', 'Foto recuperacion cadaver', NULL, NULL, NULL, 280),

-- Documentos PDF evidencias
(70, 'pdf', 'https://policia.es/documentos/contratos_forum.pdf', 'Contratos estafa piramidal', NULL, NULL, NULL, 20),
(71, 'pdf', 'https://policia.es/documentos/extractos_bancarios.pdf', 'Extractos cuentas fraudulentas', NULL, NULL, NULL, 21),
(72, 'pdf', 'https://policia.es/documentos/orden_alejamiento.pdf', 'Orden alejamiento violencia genero', NULL, NULL, NULL, 43),
(73, 'pdf', 'https://policia.es/documentos/pasaportes_falsos.pdf', 'Escaneo pasaportes falsificados', NULL, NULL, NULL, 151),
(74, 'pdf', 'https://policia.es/documentos/informe_autopsia.pdf', 'Informe autopsia cadaver rio', NULL, NULL, NULL, 282),
(75, 'pdf', 'https://policia.es/documentos/informe_bomberos.pdf', 'Informe pericial bomberos', NULL, NULL, NULL, 144),
(76, 'pdf', 'https://policia.es/documentos/contratos_corrupcion.pdf', 'Contratos amañados Ayuntamiento', NULL, NULL, NULL, 110),

-- Screenshots digitales
(80, 'png', 'https://policia.es/digital/screenshot_phishing_web.png', 'Captura web clonada phishing', NULL, NULL, NULL, 73),
(81, 'png', 'https://policia.es/digital/screenshot_whatsapp_amenazas.png', 'Captura mensajes amenazantes', NULL, NULL, NULL, 42),
(82, 'png', 'https://policia.es/digital/screenshot_instagram_fake.png', 'Captura perfil falso ciberacoso', NULL, NULL, NULL, 221),
(83, 'png', 'https://policia.es/digital/screenshot_propaganda_yihadista.png', 'Captura propaganda terrorista', NULL, NULL, NULL, 191),
(84, 'png', 'https://policia.es/digital/screenshot_correos_corrupcion.png', 'Captura emails corrupcion', NULL, NULL, NULL, 112),

-- Fotos biologicas/forenses
(90, 'jpg', 'https://policia.es/forense/muestra_adn_fnmt.jpg', 'Foto muestra ADN FNMT', NULL, NULL, NULL, 6),
(91, 'jpg', 'https://policia.es/forense/huellas_fardos.jpg', 'Foto huellas en fardos cocaina', NULL, NULL, NULL, 35),
(92, 'jpg', 'https://policia.es/forense/sangre_parachoques.jpg', 'Foto sangre vehiculo atropello', NULL, NULL, NULL, 82),
(93, 'jpg', 'https://policia.es/forense/adn_cuerda.jpg', 'Foto muestra ADN secuestro', NULL, NULL, NULL, 124),
(94, 'jpg', 'https://policia.es/forense/kit_agresion.jpg', 'Foto kit forense agresion sexual', NULL, NULL, NULL, 170),

-- Fotos armas
(100, 'jpg', 'https://policia.es/armas/foto_beretta_asesinato.jpg', 'Foto Beretta 92FS', NULL, NULL, NULL, 61),
(101, 'jpg', 'https://policia.es/armas/foto_uzi_narcos.jpg', 'Foto Uzi narcotrafico', NULL, NULL, NULL, 32),
(102, 'jpg', 'https://policia.es/armas/foto_revolver_secuestro.jpg', 'Foto revolver 38', NULL, NULL, NULL, 122),
(103, 'jpg', 'https://policia.es/armas/foto_machete_trata.jpg', 'Foto machete amenazas', NULL, NULL, NULL, 102),
(104, 'jpg', 'https://policia.es/armas/foto_bengalas.jpg', 'Foto bengalas estadio', NULL, NULL, NULL, 130),
(105, 'jpg', 'https://policia.es/armas/foto_cuchillo_vg.jpg', 'Foto cuchillo violencia genero', NULL, NULL, NULL, 40),
(106, 'jpg', 'https://policia.es/armas/foto_detonadores.jpg', 'Foto detonadores terrorismo', NULL, NULL, NULL, 193),

-- Videos declaraciones
(110, 'mp4', 'https://policia.es/declaraciones/declaracion_testigo_torrente.mp4', 'Video declaracion cajera', NULL, NULL, NULL, 18),
(111, 'mp4', 'https://policia.es/declaraciones/declaracion_victima_trata.mp4', 'Video declaracion Fatima', NULL, NULL, NULL, 100),
(112, 'mp4', 'https://policia.es/declaraciones/declaracion_testigo_asesinato.mp4', 'Video declaracion Oscar Martin', NULL, NULL, NULL, 65),
(113, 'mp4', 'https://policia.es/declaraciones/declaracion_vecinos_vg.mp4', 'Video declaracion vecinos VG', NULL, NULL, NULL, 44),
(114, 'mp4', 'https://policia.es/declaraciones/declaracion_seprona.mp4', 'Video declaracion SEPRONA', NULL, NULL, NULL, 202),

-- Informes periciales
(120, 'pdf', 'https://policia.es/periciales/pericial_cocaina.pdf', 'Informe pericial pureza cocaina', NULL, NULL, NULL, 30),
(121, 'pdf', 'https://policia.es/periciales/pericial_adn_asesinato.pdf', 'Informe ADN bajo uñas', NULL, NULL, NULL, 63),
(122, 'pdf', 'https://policia.es/periciales/pericial_informatica.pdf', 'Informe analisis disco duro', NULL, NULL, NULL, 222),
(123, 'pdf', 'https://policia.es/periciales/pericial_caligrafica.pdf', 'Informe pericial documentos falsos', NULL, NULL, NULL, 150),
(124, 'pdf', 'https://policia.es/periciales/pericial_explosivos.pdf', 'Informe pericial explosivos', NULL, NULL, NULL, 192),

-- Fotos personas adicionales (victimas, testigos)
(130, 'jpg', 'https://policia.es/personas/foto_manuel_fernandez.jpg', 'Foto victima estafa Manuel', 70, NULL, NULL, NULL),
(131, 'jpg', 'https://policia.es/personas/foto_fatima_traore.jpg', 'Foto victima trata Fatima', 85, NULL, NULL, NULL),
(132, 'jpg', 'https://policia.es/personas/foto_blessing_okoro.jpg', 'Foto victima trata Blessing', 86, NULL, NULL, NULL),
(133, 'jpg', 'https://policia.es/personas/foto_li_chen.jpg', 'Foto victima extorsion Li Chen', 95, NULL, NULL, NULL),
(134, 'jpg', 'https://policia.es/personas/foto_carlos_mendez.jpg', 'Foto fallecido accidente laboral', 92, NULL, NULL, NULL),

-- Huellas adicionales
(140, 'png', 'https://policia.es/huellas/rolex1_derecha.png', 'Huella dactilar Rolex Gang 1', NULL, 71, NULL, NULL),
(141, 'png', 'https://policia.es/huellas/rolex2_derecha.png', 'Huella dactilar Rolex Gang 2', NULL, 72, NULL, NULL),
(142, 'png', 'https://policia.es/huellas/extorsion_derecha.png', 'Huella dactilar extorsionador', NULL, 75, NULL, NULL),
(143, 'png', 'https://policia.es/huellas/carterista1_derecha.png', 'Huella dactilar carterista', NULL, 77, NULL, NULL),
(144, 'png', 'https://policia.es/huellas/menor_agresor_derecha.png', 'Huella dactilar ciberacosador', NULL, 80, NULL, NULL),

-- Fotos vehiculos implicados
(150, 'jpg', 'https://policia.es/vehiculos/foto_furgoneta_taladro.jpg', 'Foto furgoneta banda taladro', NULL, NULL, NULL, 120),
(151, 'jpg', 'https://policia.es/vehiculos/foto_lancha_narcos.jpg', 'Foto lancha interceptada', NULL, NULL, NULL, 31),
(152, 'jpg', 'https://policia.es/vehiculos/foto_bmw_robado.jpg', 'Foto BMW X5 robado', NULL, NULL, NULL, 300),
(153, 'jpg', 'https://policia.es/vehiculos/foto_ducati_robada.jpg', 'Foto Ducati robada', NULL, NULL, NULL, 301),
(154, 'jpg', 'https://policia.es/vehiculos/foto_vehiculo_atropello.jpg', 'Foto vehiculo atropello', NULL, NULL, NULL, 81);

-- -----------------------------------------------------
-- 13. RELACIONES N:M (masivas)
-- -----------------------------------------------------

-- INVESTIGADORES - Rel_Policia_Delito (asignar policías a casos)
INSERT INTO Rel_Policia_Delito (id_policia, id_delito) VALUES 
-- Serie Torrente (Paco Aguilar - Inspector anti atracos)
(3, 20), (3, 21), (3, 22), (3, 23), (3, 24), (3, 25),
-- Caso trafico Amador
(5, 1),
-- Casa de Papel (Equipo especial)
(2, 10), (6, 10), (7, 10), (8, 10),
-- Estafa piramidal (Delitos Económicos)
(9, 30), (9, 31), (10, 30), (10, 31),
-- Narcotráfico (Equipo antidroga)
(11, 40), (11, 41), (11, 42), (12, 40), (12, 41), (12, 42),
-- Violencia de género
(13, 50), (13, 51), (14, 50), (14, 51),
-- Banda del taladro
(15, 60), (15, 61), (15, 62), (16, 60), (16, 61), (16, 62),
-- Asesinato callejón
(17, 70), (18, 70), (2, 70),
-- Phishing/Ciberdelitos
(19, 80), (19, 81), (20, 80), (20, 81),
-- Atropello y fuga
(21, 90), (21, 91), (22, 90), (22, 91),
-- Rolex Gang
(23, 100), (23, 101), (24, 100), (24, 101),
-- Trata de personas
(25, 110), (25, 111), (26, 110), (26, 111), (27, 110),
-- Corrupción
(28, 120), (28, 121), (29, 120), (29, 121),
-- Secuestro
(30, 130), (30, 131), (31, 130), (31, 131), (2, 130),
-- Vandalismo estadio
(32, 140), (32, 141), (33, 140), (33, 141),
-- Incendio
(34, 150), (34, 151), (35, 150), (35, 151),
-- Falsificación
(36, 160), (36, 161), (37, 160), (37, 161),
-- Hurtos
(38, 170), (38, 171), (38, 172),
-- Agresión sexual
(39, 180), (40, 180), (2, 180),
-- Butroneros
(41, 190), (41, 191), (42, 190), (42, 191),
-- Terrorismo
(2, 200), (2, 201), (43, 200), (43, 201), (44, 200), (44, 201),
-- Maltrato animal
(45, 210),
-- Accidente laboral
(46, 220), (46, 221),
-- Ciberacoso
(19, 230), (19, 231),
-- Ocupación
(47, 240),
-- Fraude seguros
(9, 250), (9, 251),
-- Contrabando
(48, 260),
-- Extorsión
(23, 270), (23, 271),
-- Robos con violencia
(32, 280), (32, 281),
-- Casos varios
(2, 310), (17, 310), -- Cadáver río
(13, 320), -- Violencia doméstica
(21, 330), -- Conducción temeraria
(38, 340), -- Carteristas
(9, 350), -- Piratería software
(15, 360), (15, 361), (15, 362), (15, 363), -- Robos vehículos
(28, 370), -- Soborno
(25, 380), -- Inmigración ilegal
(11, 390), -- Menudeo
(30, 400); -- Amenazas

-- PERSONAS EN DELITOS - Rel_Persona_Delito (víctimas, culpables, testigos)
INSERT INTO Rel_Persona_Delito (id_persona, id_delito, rol) VALUES
-- Caso tráfico Amador
(80, 1, 'VICTIMA'), -- Conductor Bus
(22, 1, 'CULPABLE'), -- Amador

-- Casa de Papel FNMT
(50, 10, 'CULPABLE'), -- Profesor
(51, 10, 'CULPABLE'), -- Berlin
(52, 10, 'CULPABLE'), -- Tokio
(53, 10, 'CULPABLE'), -- Rio
(54, 10, 'CULPABLE'), -- Denver
(55, 10, 'CULPABLE'), -- Nairobi

-- Serie Torrente
(60, 20, 'CULPABLE'), (60, 21, 'CULPABLE'), (60, 22, 'CULPABLE'), 
(60, 23, 'CULPABLE'), (60, 24, 'CULPABLE'), (60, 25, 'CULPABLE'),
(61, 20, 'CULPABLE'), -- El Makelele cómplice

-- Estafa piramidal
(63, 30, 'CULPABLE'), -- Directivo Forum
(64, 31, 'CULPABLE'),
(70, 30, 'VICTIMA'), (70, 31, 'VICTIMA'), -- Manuel Fernández
(71, 30, 'VICTIMA'), -- Carmen López

-- Narcotráfico
(65, 40, 'CULPABLE'), (65, 41, 'CULPABLE'), (65, 42, 'CULPABLE'), -- Hamid
(66, 40, 'CULPABLE'), (66, 41, 'CULPABLE'), -- Mohamed
(67, 40, 'CULPABLE'), -- Abdul

-- Violencia de género
(30, 50, 'CULPABLE'), (30, 51, 'CULPABLE'), -- Roberto Ruiz
(31, 50, 'VICTIMA'), (31, 51, 'VICTIMA'), -- Esperanza Gómez

-- Banda del taladro
(68, 60, 'CULPABLE'), (68, 61, 'CULPABLE'), (68, 62, 'CULPABLE'), -- Andrei
(69, 60, 'CULPABLE'), (69, 61, 'CULPABLE'), -- Bogdan
(142, 62, 'VICTIMA'), -- Ana Beltrán víctima robo BBVA (tiene armas + vehículo asegurado para RF.07)

-- Asesinato
(70, 70, 'VICTIMA'), -- Víctima desconocida empresario
(108, 70, 'TESTIGO'), -- Oscar Martín testigo protegido

-- Phishing
(74, 80, 'CULPABLE'), (74, 81, 'CULPABLE'),
(72, 80, 'VICTIMA'), (73, 81, 'VICTIMA'),

-- Atropello
(75, 90, 'CULPABLE'), (75, 91, 'CULPABLE'),
(81, 90, 'VICTIMA'), (81, 91, 'VICTIMA'),
(82, 90, 'TESTIGO'),

-- Rolex Gang
(71, 100, 'CULPABLE'), (71, 101, 'CULPABLE'),
(72, 100, 'CULPABLE'), (72, 101, 'CULPABLE'),
(83, 100, 'VICTIMA'), (84, 101, 'VICTIMA'),

-- Trata de personas
(76, 110, 'CULPABLE'), (76, 111, 'CULPABLE'),
(85, 110, 'VICTIMA'), -- Fatima
(86, 110, 'VICTIMA'), -- Blessing
(87, 110, 'VICTIMA'),

-- Corrupción
(88, 120, 'CULPABLE'), (88, 121, 'CULPABLE'),
(89, 120, 'CULPABLE'),
(109, 120, 'TESTIGO'), -- Testigo protegido

-- Secuestro
(90, 130, 'CULPABLE'), (90, 131, 'CULPABLE'),
(91, 130, 'VICTIMA'), (91, 131, 'VICTIMA'),

-- Vandalismo estadio
(93, 140, 'CULPABLE'), (93, 141, 'CULPABLE'),
(94, 140, 'CULPABLE'),
(95, 141, 'VICTIMA'), -- Herido pelea

-- Incendio
(96, 150, 'CULPABLE'), (96, 151, 'CULPABLE'),
(97, 150, 'TESTIGO'),

-- Falsificación
(98, 160, 'CULPABLE'), (98, 161, 'CULPABLE'),
(99, 160, 'CULPABLE'),

-- Hurtos
(77, 170, 'CULPABLE'), (77, 171, 'CULPABLE'), (77, 172, 'CULPABLE'),
(78, 170, 'CULPABLE'),

-- Agresión sexual
(79, 180, 'CULPABLE'),
(100, 180, 'VICTIMA'),
(101, 180, 'TESTIGO'),

-- Butroneros
(68, 190, 'CULPABLE'), (69, 190, 'CULPABLE'),
(68, 191, 'CULPABLE'),

-- Terrorismo
(102, 200, 'CULPABLE'), (102, 201, 'CULPABLE'),
(103, 200, 'CULPABLE'),

-- Maltrato animal
(104, 210, 'CULPABLE'),
(105, 210, 'TESTIGO'),

-- Accidente laboral
(106, 220, 'CULPABLE'), (106, 221, 'CULPABLE'), -- Empresa
(92, 220, 'VICTIMA'), -- Carlos Méndez fallecido
(107, 221, 'TESTIGO'),

-- Ciberacoso
(80, 230, 'CULPABLE'), (80, 231, 'CULPABLE'),
(110, 230, 'VICTIMA'), -- Menor víctima

-- Ocupación
(111, 240, 'CULPABLE'),
(112, 240, 'VICTIMA'), -- Propietario

-- Fraude seguros
(113, 250, 'CULPABLE'), (113, 251, 'CULPABLE'),
(114, 251, 'CULPABLE'),

-- Contrabando
(115, 260, 'CULPABLE'),

-- Extorsión
(75, 270, 'CULPABLE'), (75, 271, 'CULPABLE'),
(95, 270, 'VICTIMA'), -- Li Chen

-- Robos violencia
(77, 280, 'CULPABLE'), (78, 281, 'CULPABLE'),
(116, 280, 'VICTIMA'),

-- Cadáver río
(117, 310, 'VICTIMA'), -- Cuerpo sin identificar

-- Violencia doméstica
(118, 320, 'CULPABLE'),
(119, 320, 'VICTIMA');

-- VEHICULOS EN DELITOS - Rel_Vehiculo_Delito
INSERT INTO Rel_Vehiculo_Delito (id_vehiculo, id_delito) VALUES 
-- Caso Amador
(11, 1), -- Mercedes CLK Amador
(18, 1), -- Autobus EMT

-- Torrente
(5, 20), (5, 21), (5, 22), (5, 23), (5, 24), (5, 25), -- Coche Torrente

-- Casa de Papel
(19, 10), -- Furgoneta banda

-- Narcotráfico
(50, 40), -- Pesquero narcos
(51, 41), -- Lancha rapida
(52, 42), -- Yate blanqueo

-- Banda taladro
(53, 60), (53, 61), (53, 62), -- Furgoneta taladro

-- Atropello
(54, 90), (54, 91), -- Coche atropello

-- Secuestro
(55, 130), (55, 131), -- Furgoneta secuestro

-- Vehículos robados
(60, 360), -- BMW robado
(61, 361), -- Ducati robada
(62, 362), -- Audi robado
(63, 363), -- Mercedes robado

-- Contrabando
(70, 260), -- Camión contrabando

-- Conducción temeraria
(71, 330), -- Coche carreras

-- Trata de personas
(72, 110), (72, 111); -- Furgoneta trata

-- RELACIONES FAMILIARES - Rel_Familiar (expandidas con términos neutrales)
INSERT INTO Rel_Familiar (id_persona, id_familiar, tipo_parentesco) VALUES
-- Familia Cuesta
(20, 21, 'CONYUGE'), -- Antonio y Mercedes (matrimonio)
(21, 20, 'CONYUGE'),
(22, 20, 'HIJO'), -- Amador hijo de Antonio
(20, 22, 'PROGENITOR'), -- Antonio progenitor de Amador
(22, 21, 'HIJO'), -- Amador hijo de Mercedes
(21, 22, 'PROGENITOR'), -- Mercedes progenitora de Amador

-- Familia víctimas estafa
(70, 71, 'CONYUGE'), -- Manuel y Carmen
(71, 70, 'CONYUGE'),

-- Víctimas trata - hermanas
(85, 86, 'HERMANO'), -- Fatima y Blessing
(86, 85, 'HERMANO'),

-- Secuestro - padre e hijo
(91, 90, 'HIJO'),
(90, 91, 'PROGENITOR'),

-- Víctima violencia género
(31, 30, 'CONYUGE'), -- Esperanza y Roberto (antes de separación)
(30, 31, 'EXCONYUGE'), -- Roberto expareja de Esperanza

-- Banda Casa de Papel
(51, 50, 'HERMANO'), -- Berlín y Profesor (dato real serie)
(50, 51, 'HERMANO'),

-- Familia terrorista
(102, 103, 'HERMANO'),
(103, 102, 'HERMANO'),

-- Relaciones adicionales variadas
(63, 64, 'PRIMO'), -- Primos en estafa Forum
(64, 63, 'PRIMO'),
(88, 89, 'CUNADO'), -- Cuñados en corrupción
(89, 88, 'CUNADO'),
(96, 97, 'MEDIO_HERMANO'), -- Medio hermanos (incendio)
(97, 96, 'MEDIO_HERMANO'),
(104, 105, 'PAREJA_HECHO'), -- Pareja de hecho (maltrato animal)
(105, 104, 'PAREJA_HECHO'),
(106, 92, 'TIO'), -- Jefe obra tío de víctima
(92, 106, 'SOBRINO'),
(111, 112, 'HIJASTRO'), -- Ocupación: hijastro del propietario
(112, 111, 'PADRASTRO_MADRASTRA');

SET FOREIGN_KEY_CHECKS = 1;

-- Revisado Final --