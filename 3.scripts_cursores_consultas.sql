-- RF.01: Como policía quiero consultar el estado del vehículo usado por un delincuente implicado en el delito que investigo.
-- Recupera los detalles de un delito específico, incluyendo al sospechoso o culpable y sus vehículos asociados para verificar su estado.
SELECT 
    d.id_delito,
    d.descripcion,
    d.estadoProcesal,
    p.nombre,
    p.apellido1,
    p.apellido2,
    p.dni,
    del.alias,
    del.situacionProcesal,
    v.matricula,
    v.tipo,
    v.modelo,
    v.color,
    v.estaAsegurado,
    v.robado,
    v.anioFabricacion
FROM Delito d
JOIN Rel_Persona_Delito rpd ON d.id_delito = rpd.id_delito
JOIN Delincuente del ON rpd.id_persona = del.id_persona
JOIN Persona p ON del.id_persona = p.id_persona
LEFT JOIN Vehiculo v ON p.id_persona = v.id_propietario
WHERE d.id_delito = 1 
  AND rpd.rol IN ('culpable', 'sospechoso');

-- RF.02: Como policía con rango comisario quiero supervisar la unidad enviada a atender un delito gracias a un aviso para asegurarme de que rindan correctamente.
-- Muestra la información de un aviso, la unidad asignada y sus integrantes (policías y vehículos), ordenados por rango para facilitar la supervisión.
SELECT 
    a.id_aviso,
    a.tipoAviso,
    a.grado,
    a.fecha,
    a.direccion,
    u.indicativo,
    u.tipoUnidad,
    u.frecuenciaRadio,
    us.nombreUsuario,
    us.email,
    pol.numeroPlaca,
    pol.rango,
    v.matricula,
    v.modelo
FROM Aviso a
JOIN Unidad u ON a.id_unidad = u.id_unidad
LEFT JOIN Policia pol ON pol.id_unidad = u.id_unidad
LEFT JOIN Usuario us ON pol.id_usuario = us.id_usuario
LEFT JOIN Vehiculo v ON v.id_unidad = u.id_unidad
WHERE a.id_aviso = 1
ORDER BY pol.rango DESC, pol.numeroPlaca;

-- RF.03: Como policía quiero poder revisar los antecedentes y la situación legal de una persona para actualizarla en caso de que participe en un delito.
-- Consulta el historial completo de una persona por DNI, mostrando antecedentes, condenas y delitos asociados para evaluar su situación legal.
SELECT 
    p.dni,
    p.nombre,
    p.apellido1,
    p.apellido2,
    del.id_persona,
    del.situacionProcesal,
    del.condenaDias,
    del.alias,
    d.id_delito,
    d.codigoTipificacion,
    d.descripcion,
    d.fecha,
    d.estadoProcesal,
    rpd.rol
FROM Persona p
LEFT JOIN Delincuente del ON p.id_persona = del.id_persona
LEFT JOIN Rel_Persona_Delito rpd ON p.id_persona = rpd.id_persona
LEFT JOIN Delito d ON rpd.id_delito = d.id_delito
WHERE p.dni = '05432102C'
ORDER BY d.fecha DESC;

-- RF.04: Como inspector, quiero obtener un listado de todas las armas con condición "dañada" u origen "ilegal" que hayan sido registradas como evidencia en delitos de tipo "Homicidio" o "Atraco".
-- Lista las armas ilegales o defectuosas vinculadas a evidencias en delitos específicos (Homicidio/Atraco representados por códigos).
SELECT 
    a.id_arma,
    a.numeroSerie,
    a.tipo,
    a.modelo,
    a.condicion,
    a.origen,
    d.id_delito,
    d.codigoTipificacion,
    d.descripcion,
    d.fecha,
    e.id_evidencia,
    e.estado
FROM Arma a
JOIN Evidencia e ON a.id_arma = e.id_arma
JOIN Delito d ON e.id_delito = d.id_delito
WHERE (a.condicion IN ('DETERIORADA', 'DEFECTUOSA'))
  AND (a.origen IN ('ILEGAL', 'DECOMISADA'))
  AND d.codigoTipificacion IN (200, 500)
ORDER BY d.fecha DESC, a.numeroSerie;

-- RF.05: Como comisario, quiero un informe detallado de los policías que han investigado más de 5 delitos en el último año donde el arma utilizada tenía el mismo número de serie.
SELECT 
    us.nombreUsuario,
    pol.numeroPlaca,
    pol.rango,
    a.numeroSerie,
    a.tipo,
    a.modelo,
    COUNT(DISTINCT d.id_delito) AS delitos_con_misma_arma
FROM Policia pol
JOIN Usuario us ON pol.id_usuario = us.id_usuario
JOIN Rel_Policia_Delito rpd ON pol.id_usuario = rpd.id_policia
JOIN Delito d ON rpd.id_delito = d.id_delito
JOIN Evidencia e ON d.id_delito = e.id_delito
JOIN Arma a ON e.id_arma = a.id_arma
WHERE d.fecha >= '2024-01-01'
GROUP BY us.nombreUsuario, pol.numeroPlaca, pol.rango, a.numeroSerie, a.tipo, a.modelo
HAVING COUNT(DISTINCT d.id_delito) > 5
ORDER BY pol.numeroPlaca, delitos_con_misma_arma DESC;

-- RF.06: Como comisario, quiero obtener un listado de todas las armas con condición "dañada" u origen "ilegal" que hayan sido registradas como evidencia en delitos de tipo "Homicidio" o "Atraco", incluyendo los datos del agente de policía encargado.
-- Realiza la trazabilidad completa (arma, evidencia, delito, policía) de armas problemáticas en delitos graves para control de cadena de custodia.
SELECT 
    a.id_arma,
    a.numeroSerie,
    a.tipo,
    a.modelo,
    a.condicion,
    a.origen,
    d.id_delito,
    d.codigoTipificacion,
    d.descripcion,
    d.fecha,
    us.nombreUsuario,
    pol.numeroPlaca,
    pol.rango,
    e.estado,
    e.descripcion
FROM Arma a
JOIN Evidencia e ON a.id_arma = e.id_arma
JOIN Delito d ON e.id_delito = d.id_delito
JOIN Rel_Policia_Delito rpd ON d.id_delito = rpd.id_delito
JOIN Policia pol ON rpd.id_policia = pol.id_usuario
JOIN Usuario us ON pol.id_usuario = us.id_usuario
WHERE (a.condicion IN ('DETERIORADA', 'DEFECTUOSA'))
  AND (a.origen IN ('ILEGAL', 'DECOMISADA'))
  AND d.codigoTipificacion IN (200, 500)
ORDER BY d.fecha DESC, a.numeroSerie;

-- RF.07: Como inspector, quiero listar a todas las personas que figuran como víctimas en delitos de "Robo con fuerza", que además poseen una licencia de armas y tienen al menos un vehículo registrado a su nombre con seguro vigente.
-- Busca víctimas de robo con fuerza (tipo 238) que cumplan criterios específicos de tenencia de armas y vehículos asegurados.
SELECT 
    p.id_persona,
    p.dni,
    p.nombre,
    p.apellido1,
    p.apellido2,
    p.direccionLinea1,
    p.direccionLinea2,
    l.nombre,
    dat.fechaEmision,
    dat.fechaValidez,
    v.matricula,
    v.tipo,
    v.modelo,
    v.estaAsegurado,
    d.id_delito,
    d.descripcion,
    d.fecha
FROM Persona p
JOIN Rel_Persona_Delito rpd ON p.id_persona = rpd.id_persona
JOIN Delito d ON rpd.id_delito = d.id_delito
JOIN Datos dat ON p.id_persona = dat.id_persona
JOIN Licencia l ON dat.id_licencia = l.id_licencia
JOIN Vehiculo v ON p.id_persona = v.id_propietario
WHERE rpd.rol = 'VICTIMA'
  AND d.codigoTipificacion = 238
  AND dat.fechaValidez >= CURDATE() 
  AND v.estaAsegurado = 1
  AND l.nombre LIKE '%Arma%'
ORDER BY d.fecha DESC, p.apellido1, p.nombre;

-- RF.08: Como comisario, quiero buscar todos los archivos multimedia asociados a personas que tienen antecedentes pero que no son actualmente "Delincuentes", filtrando solo aquellos casos investigados por policías con rango superior a "Oficial".
-- Obtiene archivos multimedia de sospechosos investigados por altos mandos que aún no constan en la tabla activa de Delincuentes.
SELECT 
    p.dni,
    p.nombre,
    p.apellido1,
    p.apellido2,
    m.id_multimedia,
    m.extension,
    m.url,
    m.descripcion,
    d.id_delito,
    d.descripcion,
    d.fecha,
    us.nombreUsuario,
    pol.numeroPlaca,
    pol.rango
FROM Persona p
JOIN Rel_Persona_Delito rpd ON p.id_persona = rpd.id_persona
JOIN Delito d ON rpd.id_delito = d.id_delito
JOIN Rel_Policia_Delito rpolid ON d.id_delito = rpolid.id_delito
JOIN Policia pol ON rpolid.id_policia = pol.id_usuario
JOIN Usuario us ON pol.id_usuario = us.id_usuario
LEFT JOIN Multimedia m ON (p.id_persona = m.id_persona_foto OR p.id_persona = m.id_persona_huella)
WHERE p.id_persona NOT IN (SELECT id_persona FROM Delincuente)
  AND p.id_persona IN (
      SELECT DISTINCT rpd2.id_persona 
      FROM Rel_Persona_Delito rpd2 
      WHERE rpd2.rol IN ('culpable', 'sospechoso')
  )
  AND pol.rango IN ('SUBINSPECTOR', 'INSPECTOR', 'INSPECTOR_JEFE', 'COMISARIO', 'COMISARIO_PRINCIPAL')
  AND m.id_multimedia IS NOT NULL
ORDER BY d.fecha DESC, p.apellido1;

-- RF.09: Como policía con rango comisario quiero poder asignar vehículos y equipamiento a las unidades asignadas a un aviso para así garantizar los recursos necesarios para cada situación.
-- Desglosa los recursos (vehículos y agentes) asignados a un aviso específico, filtrando solo aquellas unidades formadas por al menos 2 agentes para verificar la asignación.
SELECT 
    a.id_aviso,
    a.tipoAviso,
    a.grado,
    a.fecha,
    u.id_unidad,
    u.indicativo,
    u.tipoUnidad,
    v.matricula,
    pol.numeroPlaca,
    pol.rango
FROM Aviso a
JOIN Unidad u ON a.id_unidad = u.id_unidad
LEFT JOIN Policia pol ON pol.id_unidad = u.id_unidad
LEFT JOIN Vehiculo v ON v.id_unidad = u.id_unidad
WHERE a.id_aviso = 1
AND u.id_unidad IN (
    SELECT u2.id_unidad
    FROM Unidad u2
    JOIN Policia p2 ON u2.id_unidad = p2.id_unidad
    GROUP BY u2.id_unidad
    HAVING COUNT(p2.id_usuario) >= 2
);

-- Revisado Final --