# Documentación del análisis — Sistema de información para una comisaría

> Memoria completa del proyecto: análisis de requisitos, modelo conceptual (UML), matrices de trazabilidad y modelo relacional en 3FN.
> Volver al [README](../README.md) · Scripts SQL en la [raíz del repositorio](../).

## Índice

- [Documentación del análisis — Sistema de información para una comisaría](#documentación-del-análisis--sistema-de-información-para-una-comisaría)
  - [Índice](#índice)
  - [1. Introducción al problema](#1-introducción-al-problema)
    - [Contexto del problema](#contexto-del-problema)
    - [Problemática actual](#problemática-actual)
    - [Expectativas del sistema](#expectativas-del-sistema)
  - [2. Glosario de términos](#2-glosario-de-términos)
  - [3. Visión general del sistema](#3-visión-general-del-sistema)
    - [3.1. Requisitos generales](#31-requisitos-generales)
    - [3.2. Usuarios del sistema](#32-usuarios-del-sistema)
  - [4. Catálogo de requisitos](#4-catálogo-de-requisitos)
    - [4.1. Requisitos funcionales](#41-requisitos-funcionales)
      - [4.1.1. Requisitos de información](#411-requisitos-de-información)
      - [4.1.2. Reglas de negocio](#412-reglas-de-negocio)
    - [4.2. Mapa de historias de usuario](#42-mapa-de-historias-de-usuario)
    - [4.3. Requisitos no funcionales](#43-requisitos-no-funcionales)
  - [5. Modelo conceptual](#5-modelo-conceptual)
    - [5.1. Diagramas de clases UML](#51-diagramas-de-clases-uml)
    - [5.2. Escenarios de prueba](#52-escenarios-de-prueba)
      - [5.2.1 Atraco a mano armada](#521-atraco-a-mano-armada)
      - [5.2.2 Redada policial](#522-redada-policial)
  - [6. Matrices de trazabilidad](#6-matrices-de-trazabilidad)
    - [6.1. Matriz de trazabilidad - Entidades](#61-matriz-de-trazabilidad---entidades)
    - [6.2. Matriz de trazabilidad - Relaciones y restricciones](#62-matriz-de-trazabilidad---relaciones-y-restricciones)
  - [7. Modelo relacional en 3FN](#7-modelo-relacional-en-3fn)
    - [Entidades Fuertes y Subclases](#entidades-fuertes-y-subclases)
    - [Relaciones N:M (Tablas Intermedias)](#relaciones-nm-tablas-intermedias)
    - [7.1. Justificación de la estrategia de transformación de jerarquías](#71-justificación-de-la-estrategia-de-transformación-de-jerarquías)
  - [8. Matriz de trazabilidad MC/SQL](#8-matriz-de-trazabilidad-mcsql)

---

## 1. Introducción al problema

### Contexto del problema

El cuerpo de policía de la ciudad necesita una nueva base de datos para registrar a los ciudadanos junto a sus posibles incidencias (delitos, antecedentes...), será necesario poder relacionar cada persona con los vehículos registrados a su nombre, sus delitos. Además, se podrá acceder a las evidencias recogidas de los delitos cometidos.

- **Personas**: Nombre, Apellido1, Apellido2, DNI, Dirección (Línea 1 y 2), Situación Laboral (Enum), Fecha de Nacimiento, Estado Civil (Enum), Estado Persona (Enum), Descripción.
- **Usuario**: Email, Contraseña, Nombre de Usuario. (Clase Padre).
- **Policía**: Nº Placa, Rango (Enum), Fecha de Ingreso. (Hereda de Usuario).
- **Administrador**: (Hereda atributos de Usuario).
- **Delincuente**: Condena (días), Situación Procesal (Enum), Alias. (Hereda de Persona).
- **Delitos**: ID, Código Tipificación, Descripción, Fecha, Estado Procesal (Enum).
- **Vehículo**: Tipo (Enum), Modelo, Matrícula, Color, Está Asegurado (Boolean), Año Fabricación, Robado (Boolean).
- **Evidencias**: ID, Tipo (Enum), Descripción, Estado (Enum), Lugar.
- **Armas**: Tipo (Enum), Modelo, Nº Serie, Condición (Enum), Origen (Enum).
- **Avisos**: ID, Tipo Aviso (Enum), Código Aviso, Fecha, Dirección, Grado (Enum), Transcripción Llamada.
- **Unidad**: Indicativo, Tipo Unidad (Enum), Frecuencia Radio.
- **Multimedia**: Extensión, URL, Descripción.
- **Zona**: Nombre.
- **Datos (Documentación)**: ID, Fecha Emisión, Fecha Validez.
- **Licencia**: Nombre.


### Problemática actual

- **Disponibilidad y resiliencia**: Respuestas lentas en momentos de mucha actividad; paradas por mantenimiento mal planificadas; sin alternativa automática ante caídas; demasiadas conexiones simultáneas.
- **Consistencia e integridad**: Datos duplicados o contradictorios por falta de reglas claras y validaciones; sincronización lenta entre departamentos; relaciones entre datos que a veces se rompen.
- **Calidad y orden de datos**: Modelos y nombres diferentes según quién los use; falta de buenos índices y consultas optimizadas; no existe un catálogo claro de datos; tablas muy grandes que dificultan búsquedas y análisis.
- **Seguridad y cumplimiento**: Cifrado incompleto; permisos poco detallados; registros de auditoría insuficientes; políticas de conservación de datos poco definidas y riesgo de incumplir la normativa de protección de datos.

### Expectativas del sistema

- **Centralización segura**: Una única versión fiable de la información; datos cifrados; accesos por perfiles; cumplimiento de la normativa de protección de datos; cadena de custodia de evidencias garantizada.
- **Rendimiento en tiempo real**: Las consultas habituales responden rápido incluso con muchos usuarios; se usan índices y particiones donde haga falta; caché y colas para tareas pesadas.
- **Alta disponibilidad y resiliencia**: Servicio casi siempre disponible; copias de seguridad frecuentes; capacidad de recuperarse en minutos ante fallos; monitorización y alertas proactivas.
- **Trazabilidad completa**: Registro claro e inalterable de quién hace qué y cuándo sobre personas, delitos y evidencias; historial completo conservado el tiempo necesario.
- **Escalabilidad y compatibilidad**: Crece sin perder fluidez; integra con otros sistemas mediante APIs; funciona bien en navegadores actuales y en dispositivos móviles, con acceso temporal sin conexión cuando sea necesario.

---

## 2. Glosario de términos

- **Alias**: Apodo o nombre alternativo utilizado opcionalmente por un delincuente para ocultar o sustituir su identidad real.

- **Antecedentes**: Historial de delitos registrados previamente sobre una persona, utilizado como referencia en investigaciones policiales.

- **Condena**: Duración en días o sentencia dictada por una autoridad judicial a un delincuente.

- **Condición (arma)**: Estado operativo y estructural de un arma al momento de su registro.  
  Puede ser: NUEVA, BUEN_ESTADO, OPERATIVA, DETERIORADA, DEFECTUOSA o INUTILIZADA.

- **Delincuente**: Persona registrada con situación procesal activa (investigado, imputado, condenado, etc.) que puede poseer alias y antecedentes.

- **Delito**: Registro de una infracción penal donde se detallan su tipificación, fecha, estado procesal y evidencias asociadas.

- **Dirección**: Ubicación indicada dentro de un aviso reportado, asociada al incidente o emergencia.

- **Evidencia**: Elemento físico, digital o documental recopilado durante una investigación.  
  Se clasifica por tipo y estado dentro del proceso pericial.

- **Estado de evidencia**: Fase administrativa y pericial en la que se encuentra un elemento probatorio:  
  REGISTRADA, EN_CUSTODIA, EN_ANALISIS, ANALIZADA, DESCARTADA, ARCHIVADA o TRANSFERIDA.

- **Estado civil**: Situación legal de convivencia o unión de una persona:  
  SOLTERO, CASADO, DIVORCIADO, VIUDO, UNION_DE_HECHO.

- **Estado procesal**: Momento en el que se encuentra un delito dentro del procedimiento judicial:  
  INICIADO, EN_INVESTIGACION, RESUELTO, ARCHIVADO, PENDIENTE.

- **Estado persona**: Situación actual de una persona dentro del sistema:  
  ACTIVA, INACTIVA, FALLECIDA, DESAPARECIDA, NO_IDENTIFICADA.

- **Fecha (aviso)**: Momento exacto en que un aviso es generado y registrado en el sistema de emergencias.

- **Frecuencia de radio**: Canal de comunicación asignado a una unidad policial.

- **Grado (aviso)**: Nivel de prioridad o gravedad asignado al aviso por código de color:  
  AZUL, VERDE, NARANJA, ROJO, NEGRO.

- **Grupo (policía)**: Especialidad o rama operativa correspondiente al agente.

- **Huellas**: Datos biométricos de tipo dactilar almacenados en formato digital para identificación.

- **Licencia**: Certificado o autorización oficial asociado a una persona para una actividad regulada.

- **Multimedia**: Archivo digital (imagen, audio o vídeo) asociado a personas, avisos, evidencias o delitos.

- **Nº de placa**: Identificador único asignado a un agente de policía.

- **Nº de serie (arma)**: Identificador inscrito por el fabricante que permite rastrear el arma registrada.

- **Origen (arma)**: Procedencia legal o ilícita de un arma:  
  LEGAL, ILEGAL, DECOMISADA, PERDIDA, ROBADA.

- **Persona**: Individuo registrado con datos personales, laborales y civiles.

- **Policía**: Usuario con atribuciones específicas, rango y número de placa dentro de la estructura policial.

- **Rango (policía)**: Jerarquía del agente dentro del cuerpo policial:  
  AGENTE, OFICIAL, SUBINSPECTOR, INSPECTOR, INSPECTOR_JEFE, COMISARIO, COMISARIO_PRINCIPAL.

- **Registro de llamadas**: Transcripción o referencia de la comunicación realizada durante un aviso.

- **Robado (vehículo)**: Marcado booleano que indica si un vehículo figura como sustraído.

- **Seguro (vehículo)**: Indica si el vehículo posee póliza válida que cubre responsabilidad y daños.

- **Situación laboral**: Estado laboral actual de una persona:  
  EMPLEADO, DESEMPLEADO, AUTONOMO, JUBILADO, ESTUDIANTE.

- **Situación procesal (persona)**: Condición jurídica del delincuente dentro de un proceso:  
  INVESTIGACION, IMPUTADO, CONDENADO, ABSUELTO.

- **Tipo (arma)**: Clasificación técnica del arma registrada:  
  ARMA_BLANCA, ARMA_CONTUNDENTE, ARMA_DE_FUEGO_CORTA, ARMA_DE_FUEGO_LARGA, SUBFUSIL, AMETRALLADORA, EXPLOSIVO, ARMA_CASERA.

- **Tipo (unidad)**: Clasificación funcional de la unidad:  
  PATRULLA, UNIDAD_ESPECIAL, NARCOTICOS, ANTIDISTURBIOS, RECONOCIMIENTO, CANINA, RESCATE.

- **Tipo (aviso)**: Categoría del aviso según su naturaleza:  
  DOCUMENTO, ALARMA, LLAMADA, OPERACION, etc.

- **Tipo de evidencia**: Naturaleza del material recogido:  
  BIOLOGICA, DIGITAL, FISICA, DOCUMENTAL, TESTIMONIAL u OTRO.

- **Tipo de vehículo**: Categoría del vehículo registrado:  
  COCHE, MOTO, FURGONETA, CAMION, AUTOBUS, CICLOMOTOR.

- **Unidad**: Recurso policial operativo asignado a avisos o zonas específicas, con indicativo propio y frecuencia de radio.

- **Usuario**: Entidad del sistema con credenciales de acceso (email, contraseña y nombre de usuario).


----
----

## 3. Visión general del sistema

### 3.1. Requisitos generales

**1 — Acceso a datos de la ciudad**

Como policía quiero consultar de forma rápida y unificada los datos de ciudadanos, vehículos y posibles delincuentes, pudiendo relacionarlos con los crímenes y las evidencias recogidas.
- Búsqueda por DNI, matrícula y alias.
- Relación de personas con vehículos, delitos y evidencias.
- Consulta de avisos y su estado.

**2 — Gestión de datos de la comisaría**

Como administrador quiero dar de alta, actualizar y corregir los datos sobre personas y delitos para mantener las investigaciones al día y asegurar que los agentes trabajan con información fiable.
- Altas y modificaciones con validaciones y supervisión.
- Consolidación de registros para evitar duplicidades.
- Control de inventario de evidencias, armas y equipo.

**3 — Dirección del cuerpo de policía**

Como comisario quiero crear unidades y avisos, acceder a los datos de mis agentes y asignarles recursos para organizar correctamente las jornadas y operaciones.
- Crear y asignar unidades a zonas y avisos.
- Asignar vehículos y equipamiento a las unidades.
- Supervisar y aprobar los registros realizados por los agentes.

### 3.2. Usuarios del sistema

**Agente de policía**
- Consulta datos de ciudadanos, vehículos, avisos y delitos.
- Registra avisos y añade evidencias a los delitos dentro de sus permisos.
- Actualiza antecedentes y situación procesal de personas con supervisión posterior.
- Marca un vehículo como robado para generar un aviso automático en la zona.
- No puede eliminar registros; los cambios críticos requieren aprobación de superiores.

**Administrador**
- Da de alta y actualiza personas y usuarios; gestiona roles y permisos.
- Verifica y consolida datos entre departamentos para evitar duplicidades.
- Mantiene el inventario de evidencias, armas y equipo; controla su estado.
- Configura auditorías y copias de seguridad; coordina restauraciones cuando sea necesario.
- Elabora informes de calidad de datos y trazabilidad.

---

## 4. Catálogo de requisitos

### 4.1. Requisitos funcionales

**RF.01 - Consulta de datos de los delitos**

Como policía quiero consultar el estado del vehículo usado por un delincuente implicado en el delito que investigo.

Pruebas de aceptación:
- El sistema permite consultar un delito mediante su ID y recupera la información del delincuente asociado junto con los vehículos registrados a su nombre.
- Se verifica que el estado del vehículo (asegurado, robado) se muestra correctamente en la consulta.
- Si el delito no tiene vehículos asociados, el sistema devuelve un mensaje indicando que no hay vehículos vinculados.
- El sistema valida que solo usuarios autenticados con rol de policía pueden acceder a la consulta de delitos.

---

**RF.02 - Gestión de personas**

Como policía con rango comisario quiero supervisar la unidad enviada a atender un delito gracias a un aviso para asegurarme de que rindan correctamente.

Pruebas de aceptación:
- El sistema permite a un usuario con rango comisario o superior acceder a la información de unidades asignadas a avisos.
- Se verifica que los datos de la unidad (agentes, vehículos, equipamiento) se muestran correctamente.
- El sistema valida que solo usuarios con rango comisario o superior puedan registrar anotaciones de supervisión.
- Las anotaciones de supervisión quedan registradas con fecha, hora y firma del supervisor.

---

**RF.03 - Gestión sobre Historial**

Como policía quiero poder revisar los antecedentes y la situación legal de una persona para actualizarla en caso de que participe en un delito.

Pruebas de aceptación:
- El sistema permite buscar una persona por DNI y recupera su historial completo de delitos con rol, fecha y estado procesal.
- Se verifica que los cambios de situación procesal (INVESTIGACION, IMPUTADO, CONDENADO, ABSUELTO) se registran correctamente.
- Cada actualización de situación legal queda auditada con fecha, usuario y motivo del cambio.
- El sistema valida que una situación "CONDENADO" exige una condena en días mayor a 0.

---

**RF.04 - Información sobre condición de armas**

Como inspector jefe, quiero obtener un listado de todas las armas con condición "dañada" u origen "ilegal" que hayan sido registradas como evidencia en delitos de tipo "Homicidio" o "Atraco".

Pruebas de aceptación:
- El sistema permite aplicar filtros combinados por condición del arma (DETERIORADA, DEFECTUOSA), origen (ILEGAL, DECOMISADA) y tipo de delito (HOMICIDIO, ATRACO).
- Se verifica que el resultado incluye número de serie, tipo, modelo, condición, origen y delitos asociados.
- El sistema permite ordenar los resultados por fecha de registro, tipo de arma o número de serie.
- Se genera alerta cuando un arma aparece como evidencia en múltiples delitos del mismo tipo.

---

**RF.05 - Historial de Actuación policial**

Como comisario, quiero un informe detallado de los policías que han investigado más de 5 delitos en el último año donde el arma utilizada tenía el mismo número de serie, mostrando el nombre del agente, su placa y la descripción de las evidencias recolectadas.

Pruebas de aceptación:
- El sistema permite filtrar policías por número mínimo de delitos investigados en un período configurable.
- Se verifica que el informe agrupa delitos por policía (nombre, placa, rango) y por número de serie del arma.
- El sistema identifica y resalta cuando una misma serie de arma aparece en múltiples delitos investigados por el mismo agente.
- El informe incluye descripción de evidencias asociadas a cada delito con estado de custodia.

---

**RF.06 - Trazabilidad de armas incautadas**

Como comisario, quiero obtener un listado de todas las armas con condición "dañada" u origen "ilegal" que hayan sido registradas como evidencia en delitos de tipo "Homicidio" o "Atraco", incluyendo los datos del agente de policía encargado de dicha investigación.

Pruebas de aceptación:
- El sistema permite consultar armas incautadas aplicando filtros por condición, origen y tipo de delito.
- Se verifica que cada arma muestra el policía investigador (nombre, placa, rango), fecha de incautación y estado de custodia.
- El sistema valida la continuidad de la cadena de custodia y genera alertas ante inconsistencias.
- El historial de cambios de custodia se registra con responsable, fecha y motivo de transferencia.

---

**RF.07 - Perfilado de víctimas con licencia**

Como inspector, quiero listar a todas las personas que figuran como víctimas en delitos de "Robo con fuerza", que además poseen una licencia de armas y tienen al menos un vehículo registrado a su nombre con seguro vigente.

Pruebas de aceptación:
- El sistema permite filtrar personas por rol en delito (VÍCTIMA), tipo de delito (ROBO CON FUERZA) y período temporal.
- Se verifica que solo se incluyen personas con licencia vigente (fecha validez posterior a la actual).
- El sistema valida que los vehículos asociados tienen seguro activo antes de incluir a la persona en el resultado.
- El resultado incluye datos completos: nombre, DNI, dirección, licencia (tipo, vencimiento) y vehículos (matrícula, modelo, seguro).

---

**RF.08 - Control de evidencias multimedia**

Como comisario, quiero buscar todos los archivos multimedia asociados a personas que tienen antecedentes pero que no son actualmente "Delincuentes", filtrando solo aquellos casos investigados por policías con rango superior a "Oficial".

Pruebas de aceptación:
- El sistema permite filtrar personas con antecedentes (delitos previos) cuyo estado actual no sea "Delincuente".
- Se verifica que solo se incluyen casos investigados por policías con rango SUBINSPECTOR o superior.
- El resultado muestra el tipo de multimedia (foto, huellas, audio, video), delito asociado e investigador responsable.
- El sistema registra cada acceso a archivos multimedia con fecha, usuario y dispositivo para auditoría.

---

**RF.09 - Gestión de recursos de las unidades**

Como policía con rango comisario quiero poder asignar vehículos y equipamiento a las unidades asignadas a un aviso para así garantizar los recursos necesarios para cada situación.

Pruebas de aceptación:
- El sistema permite a usuarios con rango comisario o superior asignar vehículos y equipamiento a unidades.
- Se verifica que la unidad cumple con RN.03 (mínimo 2 agentes) antes de permitir asignación de recursos.
- El sistema valida que el tipo de equipamiento sea adecuado para el tipo de aviso registrado.
- Cada asignación de recursos queda registrada con fecha, usuario responsable y estado del equipamiento.


---


#### 4.1.1. Requisitos de información

**R.I.01 - Información sobre vehículos**
Como policía, quiero disponer de la siguiente información sobre los vehículos registrados:
- Tipo
- Modelo
- Matrícula
- Color
- Está Asegurado
- Año de fabricación
- Robado
- **Relaciones:**
    * Es propiedad de: Persona (0..1)
    * Implicado en: Delito
    * Asignado por/desde: Unidad (Relación inversa de "Unidad es asignado Vehículo")

Pruebas de aceptación:
- Dada una matrícula válida, se devuelve la ficha con tipo, modelo, color, año, estado de seguro y marca de robado, incluyendo propietario si existe, sin campos inconsistentes o nulos injustificados.
- Se listan los delitos relacionados ordenados por fecha, mostrando tipificación y estado.

---

**R.I.02 - Información sobre evidencias**
Como comisario, quiero disponer de la siguiente información sobre evidencias:
- ID
- Tipo
- Descripción
- Estado
- Lugar
- **Relaciones:**
    * Pertenece a: Delito (1..)
    * Es (origen): Arma (Relación inversa de "Arma es Evidencia")
    * Es (origen): Multimedia (Relación inversa de "Multimedia es Evidencia")

Pruebas de aceptación:
- Dado un ID de delito válido, se listan todas las evidencias con ID, tipo, estado, descripción y lugar; se permite filtrar por tipo y por estado.
- Si la evidencia es un arma, se muestran número de serie, tipo y origen; si es multimedia, extensión y URL válida; nunca aparece evidencia sin delito asociado.
- No se puede establecer el estado "analizada" sin fecha y responsable; la exportación del listado conserva filtros y orden aplicado.

---

**R.I.03 - Información sobre avisos**
Como policía, quiero disponer de la siguiente información sobre los avisos generados:
- ID
- Tipo
- Fecha
- Dirección
- Grado
- Transcripción Llamada
- **Relaciones:**
    * Reporta: Delito (0..1)
    * En: Zona (1)
    * Destino de: Unidad (Relación inversa de "Unidad enviada a Aviso")
    * Emisor: Persona (Relación inversa de "Persona es emisor de Aviso")
    * Audio de: Multimedia (Relación inversa de "Multimedia audio de Aviso")

Pruebas de aceptación:
- Se pueden filtrar avisos por rango de fechas y por zona; el resultado se ordena por prioridad (grado) y fecha de forma consistente.
- Cuando existe persona emisora, se muestra su identificador; si hay audio, se referencia el multimedia; si reporta delito, se muestra el ID y estado del mismo.
- La paginación (p.ej., 25 por página) y la exportación a CSV mantienen los filtros y el orden actual.

---

**R.I.04 - Información sobre personas**
Como policía, quiero disponer de la siguiente información sobre las personas registradas:
- Nombre
- Apellido 1
- Apellido 2
- DNI
- Dirección (Línea 1 y Línea 2)
- Situación laboral
- Fecha de nacimiento
- Estado civil
- Estado persona
- **Relaciones:**
    * Familiar de: Persona
    * Relacionada con: Delito (*)
    * Es emisor de: Aviso (*)
    * Tiene: Licencia
    * Propietario de: Vehículo (Relación inversa de "Vehículo es propiedad de Persona")
    * Propietario de: Arma (Relación inversa de "Arma propiedad de Persona")
    * Multimedia asociada: Foto de / Huellas de (Relación inversa)

Pruebas de aceptación:
- La búsqueda por DNI exacto devuelve la ficha con datos personales y estado; se listan los delitos relacionados indicando el rol (víctima/sospechoso/testigo) y la fecha.
- Se muestran licencias vigentes, vehículos con seguro activo y armas en propiedad; la búsqueda por nombre soporta acentos y variantes; por huellas retorna la persona asociada.
- No aparecen duplicados; si hubo fusiones de registros, se referencia el identificador maestro y se preserva el historial.

---

**R.I.05 - Información sobre delitos**
Como comisario, quiero disponer de la siguiente información sobre los delitos registrados:
- ID
- Código de Tipificación
- Descripción
- Fecha
- Estado Procesal
- **Relaciones:**
    * Investigado por: Policía (Relación inversa de "Policía investiga Delito")
    * Participación de: Delincuente (Relación inversa de "Delincuente participa en Delito")
    * Contiene: Evidencia (Relación inversa de "Evidencia pertenece a Delito")
    * Reportado por: Aviso (Relación inversa de "Aviso reporta Delito")
    * Implicación de: Vehículo (Relación inversa de "Vehículo implicado en Delito")
    * Relacionado con: Arma (Relación inversa de "Arma relacionada con Delito")
    * Relacionada con: Persona (Relación inversa de "Persona relacionada con Delito")

Pruebas de aceptación:
- La ficha muestra tipificación, descripción, fecha, estado, investigadores (placa y rango) y participantes con su rol; todas las relaciones se cargan sin inconsistencias.
- No permite marcar el delito como "resuelto" si existen evidencias en estado distinto de "analizada" o sospechosos sin procesar/descartar (según RN.07).
- Cada cambio de estado queda registrado con sello temporal, usuario y motivo para auditoría.

---

**R.I.06 - Información sobre unidades policiales**
Como comisario, quiero disponer de la siguiente información sobre las unidades operativas:
- Indicativo
- Tipo
- Frecuencia de Radio
- **Relaciones:**
    * Enviada a: Aviso (1..)
    * Es asignado: Vehículo (*)
    * Asignada a: Zona (1)
    * Supervisión/Pertenencia: Policía

Pruebas de aceptación:
- Se listan unidades con indicativo, tipo, frecuencia, zona asignada, vehículos y agentes; se distinguen supervisores de miembros.
- No se muestra una unidad con menos de dos agentes activos (cumpliendo RN.03) y se alerta si carece de equipamiento mínimo.
- Se listan avisos atendidos en los últimos 7 días con su estado y tiempos de respuesta promedio.

---

**R.I.07 - Información sobre armas**
Como policía, quiero disponer de la siguiente información sobre las armas registradas:
- Tipo
- Modelo
- Número de serie
- Condición
- Origen
- **Relaciones:**
    * Propiedad de: Persona (0..1)
    * Es: Evidencia (0..1)
    * Relacionada con: Delito
    * Asociada a: IdPersonal (Relación inversa de "IdPersonal asociada a Arma")

Pruebas de aceptación:
- Dado un número de serie válido, se muestran tipo, modelo, condición y origen; si es evidencia, se muestra el delito asociado y su estado procesal.
- No se admiten números de serie duplicados; ante duplicidad histórica se advierte y se prioriza el registro vigente.
- Si está asociada a IdPersonal, se muestran fechas de emisión/validez y se indica si está expirada; no se permite asociar armas a licencias expiradas.

---

**R.I.08 - Información sobre usuarios y roles**
Como administrador, quiero disponer de la siguiente información sobre los usuarios del sistema:
- **Datos Generales (Usuario):**
    - Email
    - Contraseña
    - Nombre de Usuario
    - Nivel
- **Datos Específicos (Policía):**
    - Número de Placa
    - Rango
    - Fecha de Ingreso
- **Datos Específicos (Administrador):**
    - Departamento
- **Relaciones (Policía):**
    * Investiga: Delito

Pruebas de aceptación:
- La búsqueda por email o nombre de usuario devuelve el nivel/rol; para policías, placa, rango y fecha de ingreso.
- No se exponen contraseñas; los datos sensibles aparecen enmascarados en listados y exportaciones.

---

**R.I.09 - Información sobre delincuentes**
Como policía, quiero disponer de la siguiente información específica sobre los delincuentes:
- Condena (Días)
- Situación Procesal
- Alias
- Antecedentes
- **Relaciones:**
    * Participa en: Delito
    * Herencia: Es una Persona

Pruebas de aceptación:
- La situación "condenado" exige una condena en días > 0; se valida que no existan valores contradictorios.
- Se listan los delitos en los que participa con su rol y estado; se enlaza a la persona correspondiente para su identificación completa.
- Los cambios de situación procesal quedan auditados con fecha, usuario y motivo.

---

**R.I.10 - Información Multimedia**
Como policía, quiero gestionar la siguiente información de archivos digitales:
- Extensión
- URL
- Descripción
- **Relaciones:**
    * Foto de: Persona (0..1)
    * Huellas de: Persona (1)
    * Audio de: Aviso (0..1)
    * Es: Evidencia (0..1)

Pruebas de aceptación:
- Para persona: se admiten varias fotos y solo un registro de huellas (1) por persona; se rechazan duplicidades.
- Para aviso: se admite un audio (0..1); para evidencia: se permite asociación (0..1); las URLs se validan y la extensión coincide con el formato del archivo.
- Todas las descargas quedan registradas para auditoría.

---

**R.I.11 - Información sobre Zonas**
Como comisario, quiero disponer de la siguiente información sobre las zonas:
- Nombre
- **Relaciones:**
    * Asignación de: Unidad (Relación inversa de "Unidad asignada a Zona")
    * Lugar de: Aviso (Relación inversa de "Aviso en Zona")

Pruebas de aceptación:
- Se listan las zonas con sus unidades activas y capacidad (n.º de agentes y vehículos) y los avisos.
- Filtros por distrito y nivel de actividad; la exportación preserva filtros y orden aplicado.

---

**R.I.12 - Información sobre Licencias**
Como policía, quiero disponer de la siguiente información sobre licencias:
- Nombre
- **Relaciones:**
    * Titular: Persona (Relación inversa de "Persona tiene Licencia")
    * Vinculación: IdPersonal

Pruebas de aceptación:
- Dada una persona, se listan licencias activas con fechas de emisión y validez; no se pueden asociar licencias duplicadas a la misma persona.
- Si la licencia está vinculada a IdPersonal, se muestra su identificador y vigencia; no se asocia si está expirada.
- Se registra quién solicita una licencia y el motivo correspondiente.

---

**R.I.13 - Información sobre Identificación Personal (IdPersonal)**
Como inspector, quiero gestionar la información de las identificaciones de las licencias:
- ID
- Fecha de Emisión
- Fecha de Validez
- **Relaciones:**
    * Asociada a: Arma (0..1)
    * Asociación de Persona - Licencia

Pruebas de aceptación:
- La fecha de validez es posterior a la de emisión; si la licencia está expirada, no puede asociarse a armas activas ni a nuevas licencias.
- La asociación Persona–Licencia mediante una misma licencia es única; no se puede eliminar una licencia con armas asociadas.
- Las consultas por ID muestran el historial de asociaciones, renovaciones y cambios de estado con sello temporal y usuario.

---


#### 4.1.2. Reglas de negocio

**RN.01- Control de modificaciones de la base de datos**

Como administrador quiero que la modificación de la base de datos esté unicamente sujeta únicamente a los administradores.

Pruebas de aceptación:
- Se intenta modificar un registro como Agente, y el sistema rechaza la modificación.
- Se modifica un registro como Comisario o Supervisor Informático, y el cambio se guarda correctamente.

---

**RN.02- Supervisión de registros de agentes**

Como comisario quiero que todos los nuevos registros efectuados por los agentes de policía sean posteriormente supervisados por un superior para evitar registros erróneos o malintencionados.

Pruebas de aceptación:
- Un agente crea un registro; se intenta marcar como finalizado y el sistema rechaza la petición por insuficiencia de permisos.

---

**RN.03- Requisitos mínimos de las unidades**

Como comisario quiero que todas las unidades creadas cumplan con un mínimo de dos agentes, que dispongan del equipamiento adecuado y que los tipos de unidades se correspondan al tipo de aviso que se registre.

Pruebas de aceptación:
- Se intenta crear una unidad con menos de dos agentes; el sistema rechaza la creación.
- Se intenta crear una unidad sin equipamiento o con tipo de unidad incorrecto; el sistema rechaza la creación.
- Se crea una unidad cumpliendo todos los requisitos; el sistema permite su creación.

---

**RN.04- Inmutabilidad de evidencias analizadas**

Como comisario quiero que los datos de las evidencias no puedan ser modificados después de que sean analizadas y al crimen al que pertenezca esté resuelto.

Pruebas de aceptación:
- Se intenta modificar una evidencia con estado "analizada" en un delito "resuelto"; el sistema bloquea la acción.
- Se intenta modificar una evidencia con estado diferente a "analizada" o en un delito no resuelto; el sistema permite la modificación.

---

**RN.05- Prohibición de eliminación de registros**

Como administrador quiero que ningún registro de delito, pueda ser eliminado del sistema; solo podrá marcarse como inactivo o archivado para mantener la trazabilidad completa de las investigaciones.

Pruebas de aceptación:
- Se intenta eliminar un registro de delito, evidencia o persona; el sistema bloquea la acción.
- Se marca un registro como inactivo o archivado; el sistema actualiza el estado correctamente.

---

**RN.06- Registro automático de vehículos robados**

Como policía quiero que al registrar un vehículo como robado, el sistema genere automáticamente un aviso y vincule el registro con los delitos relacionados en la zona.

Pruebas de aceptación:
- Se registra un vehículo robado; el sistema genera automáticamente un aviso.
- El aviso generado se vincula correctamente con los delitos relacionados en la zona.

---

**RN.07- Condiciones para marcar delitos como resueltos**

Como comisario quiero que un delito solo pueda ser marcado como resuelto si todas sus evidencias asociadas tienen como estado "analizada" y los sospechosos vinculados hayan sido procesados o descartados.

Pruebas de aceptación:
- Se intenta marcar un delito como resuelto cuando existen evidencias pendientes; el sistema bloquea la acción.
- Se analizan todas las evidencias y se procesan o descartan los sospechosos; el delito puede marcarse como resuelto correctamente.

---

**RN.08- Asociación obligatoria de personas a delitos**

Como policía quiero que un delito no pueda avanzar de estado (pasar de INICIADO a EN_INVESTIGACION o cualquier otro estado) sin que exista al menos una persona asociada (víctima o sospechoso).

Pruebas de aceptación:
- Se intenta cambiar el estado de un delito de INICIADO a EN_INVESTIGACION sin persona asociada; el sistema bloquea la acción.
- Se asocia al menos una persona (víctima o sospechoso) al delito; el cambio de estado se realiza correctamente.

---

**RN.09- Vinculación obligatoria de evidencias**

Como comisario quiero que toda evidencia registrada esté vinculada obligatoriamente a un delito.

Pruebas de aceptación:
- Se intenta registrar una evidencia sin vincular a un delito; el sistema bloquea la acción.
- Se intenta registrar una evidencia sin agente responsable, fecha o localización; el sistema bloquea la acción.
- Se registra una evidencia con delito, agente responsable, fecha y localización; el sistema la acepta correctamente.


---


### 4.2. Mapa de historias de usuario

**GESTIÓN DE PERSONAS**
* Identificación y seguimiento de personas
  - Registrar nuevas personas en el sistema
    * Crear ficha con datos personales completos
    * Registrar huellas y fotografía
    * Asignar un identificador único
  - Buscar personas en la base de datos
    * Búsqueda por DNI
    * Búsqueda por nombre completo
    * Búsqueda por huellas
    * Filtrado por características físicas

* Control de antecedentes
  - Gestionar el historial delictivo
    * Consultar antecedentes previos
    * Añadir nuevos antecedentes
    * Actualizar estado legal
    * Vincular con delitos relacionados

**GESTIÓN DE DELITOS**
* Registro y seguimiento de delitos
  - Documentar nuevos delitos
    * Crear ficha del delito
    * Asignar tipo y descripción
    * Vincular víctimas y sospechosos
    * Registrar ubicación y fecha
  
* Control de evidencias
  - Gestionar evidencias
    * Catalogar nuevas evidencias
    * Asociar evidencias a delitos
    * Actualizar estado de análisis
    * Mantener cadena de custodia

**GESTIÓN OPERATIVA**
* Coordinación de unidades
  - Gestionar las unidades policiales
    * Crear nuevas unidades
    * Asignar personal a unidades
    * Distribuir equipamiento
    * Definir zonas de patrulla

* Respuesta a emergencias
  - Gestionar avisos
    * Registrar nuevos avisos
    * Clasificar por prioridad
    * Asignar unidades disponibles
    * Hacer seguimiento en tiempo real

**GESTIÓN DE RECURSOS**
* Control de inventario
  - Gestionar el equipamiento
    * Registrar nuevas armas
    * Actualizar estado de vehículos
    * Controlar equipo asignado
    * Mantener registro de mantenimiento

* Supervisión de accesos
  - Gestionar usuarios del sistema
    * Crear nuevos usuarios
    * Asignar roles y permisos
    * Monitorear accesos
    * Actualizar credenciales


---


### 4.3. Requisitos no funcionales

*R.N.F. 01. Alta disponibilidad del sistema*

El sistema deberá garantizar una disponibilidad del 99.9% anual (permitiendo un máximo de ~8 horas de inactividad al año para mantenimiento programado).

*R.N.F. 02. Capacidad de usuarios concurrentes*

El sistema debe soportar al menos 500 sesiones de usuarios activas simultáneamente, garantizando que el tiempo de respuesta no supere los 2 segundos para consultas de Antecedentes o Vehículos bajo esta carga.

*R.N.F. 03. Respaldo de datos periódico*

Como administrador quiero que se realicen copias de seguridad incrementales cada hora y completas cada 24 horas para prevenir pérdidas de información crítica.

*R.N.F. 04. Escalabilidad vertical del sistema*

El sistema debe ser escalable para gestionar un crecimiento anual de datos del 30% sin pérdida de rendimiento.

*R.N.F. 05. Compatibilidad con navegadores*

Como usuario del sistema quiero que la aplicación funcione correctamente en los navegadores web más utilizados (en sus dos versiones más recientes) para acceder al sistema desde cualquier equipo sin problemas de compatibilidad.

*R.N.F. 06. Accesibilidad multiplataforma*

El sistema debe ser accesible desde dispositivos móviles, tablets y cualquier ordenador. Además, la aplicación móvil para las Unidades debe contar con capacidad de funcionamiento offline temporal para consulta de datos cacheados en zonas de baja cobertura.

*R.N.F. 07. Seguridad de datos sensibles*

Como usuario del sistema quiero que todos los datos personales y confidenciales estén cifrados tanto en reposo como en tránsito para proteger información sensible de accesos no autorizados.

*R.N.F. 08. Auditoría y trazabilidad*

Como administrador quiero que el sistema registre inmutablemente cada acción de lectura, escritura o borrado realizada sobre las entidades Persona, Delito y Evidencia, incluyendo el email del usuario.

*R.N.F. 09. Disponibilidad de datos de alto riesgo*

Como agente de policía quiero que las consultas de Matricula y DNI devuelvan resultados en menos de 3 segundos en el 95% de los casos, para minimizar el tiempo de exposición durante una intervención.


---


## 5. Modelo conceptual

### 5.1. Diagramas de clases UML

![](https://uml.planttext.com/plantuml/svg/dLV1Zjis4BqRy3-mUscxI8mwHwCjujfgQy3TDUmqXnGzp4gpscabKY0b8sYQZyetvCSw92LHjEMDKIzWMSF7uPitmo5tEdbjQj1rKnRJoLVr4vOegW98JYVTtzVYXozyB6QrNHwIWzZjDtUhpMwvJGxNpKmBC4RiK1ibGNoOJeIGgdpGk127MfFChGKgB0hAr7pC-6fep2H5hwGnJKd9BKc4-UMXo8cXkW4t10zAGx4uirZK8wPFSCVMab3MQY7MKACTG5OqKoiw4izCmaiOQyDTnA-E5PfKKsMNMeW_lflDvdzE9nzj6hnGxnZdH6fLYWQtbA9CwOAC0o0pLSQZA5k8ZQmnHzq7bPHa784k8cTz2wms_jDP1-v-DmreKjuXbc3Z3cgcIjOQ37x-14EpfzTE7MMvKmM5Q9eIjTeLa4PUDCYSP-_jeyNtX3FSo5oZKIEKbrb9aWmJovIsAmpLmO9asd1IqQ_D4MGeOKrW8h7wgjXfbQAnXN8uDRbABTnCpteigtR5Meqc95KPvUeDLVH8AVYw60n7zH9aSV6VLcHWcKJliJ17CkDCQgfOIMQY72QGSw_dLHIMxxVQcGP2v3O32_6BVVH-EIsoZskxXH8oU4w_j_X4QLEql0FHpcwjfSgmK4EHIk2VF0nnjHPA3mrMkwN1lF54VrAgG90khPy_gP_XGO_bHQk763vWcnnv7uLzUb7c7lTCedrckumEPWnJgaiuLSRQnbNn6-s0cl1a5sVaLrzrFpidIbEEF73ldjuwR0-ICiZQOErKgEaOhHbuUQoh8QwPnWMpX-n2X_YjAMegCUkanFSrIdCYKQEZTZGgvCVh3xfVatt2HzpoolEjwutV__lofUWxL6IDUj5qqfs5RcpGYon5gRWdAIdO-BSDvWCFgh8gi8ONlCtCNusiWOD1cGcBlJwiVR9ThZRtTto69tTlzedztgoNwslFyM7JlBcz4SpTFjhEjX0LNp8uzWe4Il7ZT18sGOUUpsRH1DISJ4nHWCNtMtpCER44N5QPQfsVWMtBkEbl6VRS5PLM5Q4jp0pj7BTBBk5FmMr9nzHzwsJdyaZSi3pl3ZdlMVVa70qmb4lBt59m3c8EVOmQAwLh25JzU406HPtZqv1k8r-5QrcM9MziY-qEsr5vvP7x3ELkyKwK0J3ez0WbyM6dMva6-tDKMPwWU8MBu27ogU7h7fWHSAH2UnX1mptZIonwnJh1-jX2jbf_5e1yBL8sj74LkjlNWjiP5wxrv-zPivdufiM_w57VTgDdURHPum2CIf-hedTEbBPwMbHSF_CEvFV426EVuD5o-7-Dux1Bk3FotL-i4x6xtsxuxJe_VVczSbifgD56VjOF-Wb1kzi1sZICPpd01_EQ6oB_Y_CV)

![](https://uml.planttext.com/plantuml/svg/ZLNRZjf03Fq2_Y5l_OfAQoPEy6eoZkQ2gds9AA1j93QfODcNQl-zdfc4Mokrl60RNyxOn-RfzBuvlf_V3el5b-BhFpxYWYOqxdzSzyFvhN3z-tcpxST1RxwFnysX-BKe2cnQZL2oY2Mw6ms2PyDD59_3adIselEX930U5vyvAmhctOWV_Mu_RFjDIbeK5cjota89IKNJgU0yI-YiWm5DZbpIa_8oUmiG1TRFAbYrelMiILBZAhGa-kVY5eFgF_hyACVQeuru5RZfSRHcgoWhQmhfEnXYqvNOhL2j-25Tkp-UnY4_29GN12AGkOWLQ8sA4Yn132tOMJNSKOd6KqKARd3QpV0wjkEXdni5DSPM5WMB9u6EsANPnhMeFDjKy2zozunLZ5BSa0DBV2jthIMZg9LiSrtV_npXep-DgMZ9AZHIDqrPWstW8dIED4emksZJ6fhSzadgi45RHuTev1OjYA-vrAcFqhTh8NW9yKLhj6L4Qq16znmZBJ_7uWPhotSWr_iV_VPyoE6ArIh6DPoWLi7MRD136ciJwsQMBaCaaIAbERhQkuptn5mIQwvbA8aHDVdKyafuc4rJPvBL2zUfOPF7mlu1AXpVPhAdpYqr60LNNR7nmPJJV2UZKAqAMBFyQZtynIvJgBDTU5056KTsQb1uh-CIscc3lhMQdP3wfY8u6KW4cL6gSTZrSTzle9g0wvnW6MG9vObv8wPfJjIEX9O58hRNbQo4UI7p8Z8nU9eszbAFZ_th_bfCOvqwHxDGOkPeIYdLohmibfUtEn9x6uP-jzcbB2ru6-JXULjBA0MpB44UYZ1AiIV5aG1obAYKenEiJ3aQP1tbWYbgQ2Ax0YFxctwH0vDEsCDbR8_ZTd-QJYEPTQH0dJakUjE6gLsIM2Ox7Sgb2wZz7-VZFXNDjqUw_fXOuEGCrrl7gKMc9CodTl6q7tRon_0R)


![](https://uml.planttext.com/plantuml/svg/RLGvRXmn47p1_g6XM13Wsw44IGO4279WEpPQP6ktZHdscCV0gzyuLA30SEPqFkOYPqU7lSboIFPHrLNSuvGvvj9tgrMmBCI9Ngo8wD8IUSxrLwZ3gOpg9JZ5Pp0QYdWEb2HIRrvlrB5liMaeqrrB-bu4zmZYm9tUiaVcbhWZ5xMNKBzgo20nIv1RnoGfJtSK9HNfiXrL69-icviXOSDE8hOT6h7lDMZA4MsHSBIIuAaIUAJnShLBBu46wnJGoLcWo65jT6gz9evgP9GAGAZ5kT6y7UijKjMptr__5UfVQLXFVr1JrXMCLTvUEirsE8-eJGW7G0kazOuI8gNd8rhm3URZz9DwZevZ4e3iZH3lieuL7iutEjRqWICZBjI1HQX2u7_BrzfLb3Llw2JpefY64HFLDJkri9_3Qs3u4dQGAIt3dc4tGEZQy2og03vbgrgcyimKd0nh4vaX5RoXo7tK7fssJRfaQH2tCQmqQd2bQzRPy7P96g8vIUsqZYnXBBdkzZ5uKrK0Ajc9jrEYQKUXo6WFx3GqmyaF172r7ro85YLmDM4oh0k9whtpG0xxHqcRlU4WX03C8NRNKeLpKPfkvOaFeF1W4JsyF6jmSFNnwyNP-TNdYmyNfoTd9mU7rGOmjojRM_fTWzdqYxtELRdrZJeudNw7sKFbczGNylyytZP5gqjodExhS2i4PsuZ3u1d-w3CZKN4GIKlhc32-mg-Gy7Bzd8mrIJ0DNEYaafxFmtlNBAVxeF2BE_19CA_yi_JFCOd_ch-0W00)


---

### 5.2. Escenarios de prueba
#### 5.2.1 Atraco a mano armada
![](https://uml.planttext.com/plantuml/svg/bLVDRjiu4BxxARY-x6KTIqhis05Ir6ixs3Hn4kIdw2u211E9LfXGf41AHfF57lPH-W0z57lhrI-sCvIiI4xSdnvIcHmEv_lcbszj1YRB4zdw9RlZ2MUf1A5QhL_P_dV-eSZfx--cbwSNR38zPkFHnUaU6rsUZyQdRCGk3wSdaz6Fg6dfstiUPgmzuL9akit0iiXzUfxF_cun9YAsp_07VeOw4h6-5AcOYn12eHLk1Jl1rZPkHjo6HgJbQljAiJkTt1gE6uoh33-slSwEns3vHLi69e58eqR5SWNCy52R32AuLezimMqcgaqM2Jity4HwpiG3X7UvqmVubt79f0v1NYj8k88dK7WE90lXdXlD7fc-bIAcLSaP57R4O2I_LdWq4egaKB44Ea9snCAYxaWRQ2EeEG_l0E7u_QxlTGClwE4YceS2PqQ7tE9T--oSsvpBJBV-QVAfmXnlv8xKHuqN4f-gO6MV_Oah-1jIBYN2zKaH9ClFXZ_LbWDSFj0IOcs8P2N8ci3R7dgz_W6j2EIEI3z6C41Amkxu3enu0XEzs2TjgjiVueOLMUvyU0otY9PmZF9i-H_QfrV8Jr0W4OX1uswlwmTTVpWOLXICnKBGkGijCoJocHfkh5R4soZCn09SwAW87JGHI0K2y8QzkWarBiU5O4JQG1RYRQJkM8VaAVVnmCatWDI6F2A6dT1x14sHjH0M_qkreSWnEKOaWd97jK5fbYw_Ob2WDawnjI1RBUCBGcdRTHUEC4QTxp2oTSepMAL49b8YXFPl9lpc8ESncPjel4IxU4Y4YZCCty6knwOVKyEj9TVd2T9qmOqW_vzFSVV3JYyO_buI9ChacO6ycJecSKCR4NDQdP0PIeSO50qh2Qypqo7tlErwscvNQUlaoEht7KpP3iLon_SwVhy6I59Qtbm8oHMQOc5J1bH1vSBjGi83uiN0yZtSZ2bzSEFAnEGRKcz0LSNXM0AcFgbKkPHr90z0WRR7_iBOSO2AXKRI7D5I_L0PQqx-NkELJVbtjBIMPJEaL4fOIx9fFWV3HPLaExt-xc0OR1zjIB8IzOOKSqoyacBJ99MySEpB3FDxNMyREVRwFvzYTKeqXhSeA4b4d9U5XoVWL2NYWUAJlurfOIlKIH5-w2NBbrz8PoImbCQvm7YeoBooEIKOyITYpEDHd5SXVIOXf7Dd7GndwXJey9X4J-TaYLoXZVYXYZ4P7DYWw_K9hB_9zaYh8mn20_Tv0y13kIYKJV6GDjz0WkL4SM98P8-7JluLG9FdYrw1v0zt1pL8XwjRNmE5xlE6M2I7NXtKbH8HH4MEEbQB3AM41pID3Yx_THlFkNW6cScBA9rZUEMKaN0EaIW2fRyrOBC_dkgtlETt8inbKGiIU8hMwzLOXtUyNgTc9CHc7oYb4xoFZeCB_K70ZevdZas9XHIBbRvV1T_8yZWlSnnjTDc5FVq0RarjAl227I9DtnQ2Sv2MrwsTBaJaC1KLTlNByxrQ-N9PL5f_82ogVpbep9QVR8Y-gyy7kQKAGoq0Op_b1ektw-djAd-8uQBfHAHJvZWLK7hQ49kFQnPu1sO9D2hKB9UPI7YqIgxgvuff_Z7ZoXQMtQTK77938Tkj0Dfk25Ib_Mu2pkwRj33w1jUsYZDh20zqfh6epfUVePnLabSmKv0WL3T3ORz0ATu4mzLlZ3eH5XiQTAo8ScsliTiocoCtB2M5e9QV939DKo0RJKxQFmW_-6dugwPwKyr-FyF0wlJpvDZikjSAfo_8QQE66jN6O3DEHGBn8rktD0e-ChNycfIZe7Nj6ScWmfLG1sDIqB3QtjHs8382LBFlZ71j-KcjTPu3xELwhU-SYJ3BqS2gyGI3tivkV-ZFDZIUoqSiHI9pfVcrrZFmDqvtUkDm5s0r7b3XUXvmLwrd3BPeM9ixpm-zLywdnwFnuUd9z89DJoxFfwi7p0yzKzputEdKtYPxvACCcqNgNW9lMeqQiYxA3KOcZelu2439sZot9cYuTBHHGD7xuqshhDWeLyrNUtZXGf08QQkMNwXAAJBN95P3Jc5oqv060XInA58sy3NTGhb7KapQwsto6sB5SDI4GLTWrbYQbJbTrYXecongf3q9rL2yiBgaRzq5pwnMdSeT1IjYcluR8YlEoisIzYBhlkk_rbkk8dfY_my0)

#### 5.2.2 Redada policial
![](https://www.plantuml.com/plantuml/svg/pLZDRXiv4hxxARY-P0T8BAabI_O0iuXiouap_Z5aps2n262KoBBCX4tsajr6ui4Szb7o03aCvhROcrvigqXtf9Ob9TWVO7A8kwkAnVe-LXUhz3AKuCigDrj_AkymHr4Oq7PhwvduuIl_oEJYuCte-k9A78rEnU7mwk9xCHuT3O-6udmuFhou7i_-SNnoUF4jlhRSv1tAKcmhDBfqlQmjlXT7yNbRG11pyIzRGcWbVX3qGe_IAJrrrxhGjrg2rCwIgjlV8vN28Bqk7cNROrIWG7W4en_u2Qr08wIf9kBPo8XhaBFVhRZsSAynk6TlRK7C8BaHbGNX2lJadqsaiwM7k7ZsYKoCoF43xMxTM_lir0Nnga9FuOPdsnJ6BSexe03QMQkJjR9sjaj29DgLk_HEOW13sakqIgCjyUPDfIdahL_ddBohm9AxHqQihDWkqb9hc1Jhyeb7SlKc2Ka41HgZbUiyIXT4sQC87vWfg-crFyYwlRtzpYbBj4V9p9rgYy3hPUlmJXCI1YPUexUpJrRHwcLRTcnR-oGFkgmWoc7YV4HvX07pmY1Xhvav9vESaJlITtPRxLwhixytv-XGtsjUUWY1tkRKeG_ECg_7O0nAhI1c0yLauKX3OCONWwYvNbWHAJB9TXkDW9nIYS_Ra6XAHjf2s6OZubkYOjgZxRMVVQ9qYxRAkocP_pbhTzhF1Vs_-zrpGT6LQD5A3MyvT_mKh7weqySJO0ichid8-i20_Nk5b3taJqAXIp2ONEwH-lhHaz1czbcIahS5dwTTi_Ptsul9elG7PrUaIfGt4-M8HKjfSWOV8IpboJbKNvAajziVx56Ul5wJ96UOEt4XxnoioOnETtLglAacsgpBY_ZjK5uCdkR5pxfQcHOd5cIfxvzc1PaKIDklIOx3PDnC3YeFhsR_YXyrC-JyggmudNrMw8N2TUTTUh31nWt1F7zhyza_JQaBFci9Vke2hosVvXQ8AQqaX18CqBexbsjAN-t2Su4VIkS3x_ESS7fV5MbJMdrRsRYL9yD6Yi2z3gxT7r2M3FanvaSjd1TOUg572j3HoqKgVywkgMZpioP5uIXJfyuwIcqNIYGr8L3iP-pU4RE9Yhewdnh8GR57Mncp6Ea4F4K_TdHGGD7-ZT34O1loHauVH8r8gWPeoYIh7NcvT8ReIuvgAVl07696aMo2_iwPbrEMx4YNapOL_O2ptpZGeGK9NhdmPU-VGiLCa-uKnaXh2hG1M5tbwDsbeGMSVI-wUptcrOETHc9lEHXJqwhmn4uzXbWDswrsjyKbfS69WI2NSKHX4qOIXTnDD-38scrnyUCA44CpTSfPIHclSFXG4TeLMBBERdy1ouaD1SNe_2eqMTPgxnEQTWFDUm-S-4qqITX0aqGRaDmxzHwCpfrTWUOQlVygc4uss5i0S-Xo7NZzAZ1jkgZwL93s6s0KIgTY8wAS9qm_MQr0HKXD5IFJLj4RbIZsTxIe7ja3UEVctrvoSuD4Rfqg7hcqqziOL4JOwMSxFN7s-c4ndjlAJvtjK2G_8rtUbKcVUYt-PRx5SHJHUquC6PQSeUVY5buSe7qGLuNNjaHF7pJ5dQfZ3gLdfymUtGaTSN3qrtWindc-DN3gwy8y33Yj7Yj0wIiaCSn-SySmyVEkZGf9b_btasHu2oRWKpZPQZZP_nXEzd-7W_TQnJFS7UmIfb7z6a4jAkSbcLxc8Ayg2eLDdlQwNVgitskJRXJf9Cm-szZmtiQY9RILK9N0ZoGao3usnzjVxj5KubAZl2Rc_gQO-uinznSEHWSjLmHyN0LjI4Xkm9HE37zyqHlCmsn4IJUWfD2utWzs-jc7xdwUy-LduorArfuTTTjY0WP20rEwvzTZ6cp2D5Z4DFXZOyehK-eSbOPskqkWpkhtXAgfPbZKHw0DAVAyw96ayeQUMww--36q90IUmLeJfpvAo6-ALBDlqgLsqyuw6NS3DnQhqdFsn8KxvEyfEwyyJA3kLNYGoi438VQ5ewKaC_NLA8RfagRskFBST35joBLVWO0qmUs8AnHk4j3Vny4iTpbPq18YcLhhUYQAVn_d7c9Gp0DLP4kFGNWCEfJQ1sJVuEcTrdqKG0xX0NmybCh61dnx7UMzpPJt_dFATNt5tgJRTqvwIgp_Yl7v1SupIP0Bb9FIuvIOyIvQ6YV1HDQLanMJ7Nc_0sFWOKeBF_8ffPZcct95MbcReZs9RlcRmP2-bSS9FSn-By6cRJdh9mRhqQ1n0ATWWNXF8q0YtO1TwW_PQ6da6Jk5Rddc8RAimYzZ3m_6JFVbch7dLQMDGV-LsMTtzUWpsZWIKziqu4uZUpBwN3bJeeSLmyymZJw_VkFlEEFHwV3mvE9yT2L6vzVZKVt3phUitgf_WtZnGYp-U5E0BxNKHRns_hALni_DDeqxRzaqJTGI1JGj-zziETXisUpGo7HXJ49xhq51jAl5ozuy5iwNonRD2IRXh8UE9GVQtcCezPHTnEPzeqLgY3TODBPfO6iYRswsoIvjkT9kCvFpFXI3WA2dbZJh3RFDXYjeZQRr0JKlDpAkYOXUc_eUwnF-Miqreq4h7wr9Kxi2Blzaz1AjgdBpRm00)

---

## 6. Matrices de trazabilidad

- Matriz de trazabilidad entre los elementos del modelo conceptual y los requisitos.

### 6.1. Matriz de trazabilidad - Entidades

| Requisito                                    | Persona | Usuario | Policia | Administrador | Delincuente | Delito | Aviso | Vehiculo | Evidencia | Arma  | Unidad | Multimedia | Zona  | Datos | Licencia |
| :------------------------------------------- | :-----: | :-----: | :-----: | :-----------: | :---------: | :----: | :---: | :------: | :-------: | :---: | :----: | :--------: | :---: | :---: | :------: |
| **RI.01 - Información sobre vehículos**      |         |         |         |               |             |   X    |       |  **X**   |           |       |        |            |       |       |          |
| **RI.02 - Información sobre evidencias**     |         |         |         |               |             |   X    |       |          |   **X**   |   X   |        |     X      |       |       |          |
| **RI.03 - Información sobre avisos**         |    X    |         |         |               |             |   X    | **X** |          |           |       |   X    |     X      |   X   |       |          |
| **RI.04 - Información sobre personas**       |  **X**  |         |         |               |             |   X    |   X   |    X     |           |   X   |        |     X      |       |       |    X     |
| **RI.05 - Información sobre delitos**        |    X    |         |    X    |               |      X      | **X**  |   X   |    X     |     X     |   X   |        |            |       |       |          |
| **RI.06 - Información sobre unidades**       |         |         |    X    |               |             |        |   X   |    X     |           |       | **X**  |            |   X   |       |          |
| **RI.07 - Información sobre armas**          |    X    |         |         |               |             |   X    |       |          |           | **X** |        |            |       |   X   |          |
| **RI.08 - Información sobre usuarios**       |         |  **X**  |    X    |       X       |             |   X    |       |          |           |       |        |            |       |       |          |
| **RI.09 - Información sobre delincuentes**   |    X    |         |         |               |    **X**    |   X    |       |          |           |       |        |            |       |       |          |
| **RI.10 - Información multimedia**           |    X    |         |         |               |             |        |   X   |          |     X     |       |        |   **X**    |       |       |          |
| **RI.11 - Información sobre zonas**          |         |         |         |               |             |        |   X   |          |           |       |        |            | **X** |       |          |
| **RI.12 - Información sobre licencias**      |    X    |         |         |               |             |        |       |          |           |       |        |            |       |       |  **X**   |
| **RI.13 - Información sobre identificación** |         |         |         |               |             |        |       |          |           |   X   |        |            |       | **X** |          |
| **RN.01 - Control de modificaciones**        |         |  **X**  |         |       X       |             |        |       |          |           |       |        |            |       |       |          |
| **RN.02 - Supervisión de registros**         |    X    |         |    X    |               |             |   X    |   X   |    X     |     X     |   X   |        |            |       |       |          |
| **RN.03 - Requisitos unidades**              |         |         |    X    |               |             |        |   X   |    X     |           |       |   X    |            |       |       |          |
| **RN.04 - Inmutabilidad evidencias**         |         |         |    X    |               |             |   X    |       |          |     X     |       |        |            |       |       |          |
| **RN.05 - Prohibición eliminación**          |    X    |         |         |               |      X      |   X    |       |          |     X     |       |        |            |       |       |          |
| **RN.06 - Registro vehículos robados**       |         |         |         |               |             |   X    |   X   |    X     |           |       |        |            |   X   |       |          |
| **RN.07 - Delitos resueltos**                |    X    |         |         |               |      X      |   X    |       |          |     X     |       |        |            |       |       |          |
| **RN.08 - Asociación obligatoria**           |  **X**  |         |         |               |             |   X    |       |          |           |       |        |            |       |       |          |
| **RN.09 - Vinculación evidencias**           |         |         |    X    |               |             |   X    |       |          |     X     |       |        |            |       |       |          |
| **RF.01 - Consulta delitos vehículo**        |    X    |         |    X    |               |      X      |   X    |   X   |    X     |     X     |       |        |            |       |       |          |
| **RF.02 - Gestión personas**                 |         |         |    X    |               |             |        |   X   |          |           |       |   X    |            |       |       |          |
| **RF.03 - Historial antecedentes**           |    X    |         |    X    |               |      X      |   X    |       |          |           |       |        |            |       |       |          |
| **RF.04 - Condición armas**                  |         |         |    X    |               |             |   X    |       |          |     X     |   X   |        |            |       |       |          |
| **RF.05 - Historial actuación**              |         |         |    X    |               |             |   X    |       |          |     X     |   X   |        |            |       |       |          |
| **RF.06 - Trazabilidad armas**               |         |         |    X    |               |             |   X    |       |          |     X     |   X   |        |            |       |       |          |
| **RF.07 - Perfilado víctimas**               |  **X**  |         |         |               |             |   X    |       |    X     |           |   X   |        |            |       |       |    X     |
| **RF.08 - Control evidencias multimedia**    |    X    |         |    X    |               |      X      |   X    |       |          |           |       |        |     X      |       |       |          |
| **RF.10 - Gestión recursos unidades**        |         |         |    X    |               |             |        |   X   |    X     |           |       |   X    |            |       |       |          |

### 6.2. Matriz de trazabilidad - Relaciones y restricciones

| Requisito | Delincuente → Delito | Policia → Delito | Evidencia → Delito | Vehiculo → Delito | Persona → Delito | Arma → Delito | Aviso → Delito | Vehiculo → Persona | Arma → Persona | Persona → Licencia | Datos → Arma | Unidad → Aviso | Unidad → Vehiculo | Unidad → Zona | Aviso → Zona | Policia → Unidad (P) | Policia → Unidad (S) | Multimedia → Persona | Multimedia → Aviso | Multimedia → Evidencia | Arma → Evidencia | Persona → Aviso | Card_Evidencia_Delito | Card_Unidad_Aviso | Card_Aviso_Zona | Card_Multi_Persona | Herencia_Usuario | Herencia_Persona |
| :-------- | :------------------: | :--------------: | :----------------: | :---------------: | :--------------: | :-----------: | :------------: | :----------------: | :------------: | :----------------: | :----------: | :------------: | :---------------: | :-----------: | :----------: | :------------------: | :------------------: | :------------------: | :----------------: | :--------------------: | :--------------: | :-------------: | :-------------------: | :---------------: | :-------------: | :----------------: | :--------------: | :--------------: |
| **RI.01** |                      |                  |                    |         X         |                  |               |                |         X          |                |                    |              |       X        |                   |               |              |                      |                      |                      |                    |                        |                  |                 |                       |                   |                 |                    |                  |                  |
| **RI.02** |                      |                  |       **X**        |                   |                  |       X       |                |                    |                |                    |              |                |                   |               |              |                      |                      |                      |                    |           X            |        X         |                 |         **X**         |                   |                 |                    |                  |                  |
| **RI.03** |                      |                  |                    |                   |                  |               |       X        |                    |                |                    |              |       X        |                   |               |      X       |                      |                      |                      |         X          |                        |        X         |                 |                       |       **X**       |      **X**      |                    |                  |                  |
| **RI.04** |                      |                  |         X          |         X         |        X         |               |                |         X          |       X        |         X          |              |                |                   |               |              |                      |          X           |          X           |                    |                        |        X         |                 |                       |                   |                 |                    |        X         |
| **RI.05** |          X           |        X         |         X          |         X         |        X         |       X       |       X        |                    |                |                    |              |                |                   |               |              |                      |                      |                      |                    |                        |                  |                 |                       |                   |                 |                    |                  |
| **RI.06** |                      |                  |                    |                   |                  |               |                |                    |                |                    |              |       X        |         X         |       X       |      X       |          X           |          X           |                      |                    |                        |                  |                 |         **X**         |                   |                 |                    |                  |
| **RI.07** |                      |                  |                    |                   |                  |       X       |                |                    |       X        |                    |      X       |                |                   |               |              |                      |                      |                      |                    |           X            |                  |                 |                       |                   |                 |                    |                  |
| **RI.08** |          X           |        X         |                    |                   |                  |               |                |                    |                |                    |              |                |                   |               |              |                      |                      |                      |                    |                        |                  |                 |                       |                   |                 |       **X**        |                  |
| **RI.09** |        **X**         |                  |                    |                   |                  |               |                |                    |                |                    |              |                |                   |               |              |                      |                      |                      |                    |                        |                  |                 |                       |                   |                 |                    |      **X**       |
| **RI.10** |                      |                  |                    |                   |                  |               |       X        |                    |                |                    |              |                |                   |               |              |                      |          X           |          X           |         X          |                        |                  |                 |                       |                   |      **X**      |                    |                  |
| **RI.11** |                      |                  |                    |                   |                  |               |                |                    |                |                    |              |                |                   |       X       |      X       |                      |                      |                      |                    |                        |                  |                 |                       |                   |                 |                    |                  |
| **RI.12** |                      |                  |                    |                   |                  |               |                |                    |                |         X          |              |                |                   |               |              |                      |                      |                      |                    |                        |                  |                 |                       |                   |                 |                    |                  |
| **RI.13** |                      |                  |                    |                   |                  |               |                |                    |                |                    |      X       |                |                   |               |              |                      |                      |                      |                    |                        |                  |                 |                       |                   |                 |                    |                  |
| **RN.01** |                      |                  |                    |                   |                  |               |                |                    |                |                    |              |                |                   |               |              |                      |                      |                      |                    |                        |                  |                 |                       |                   |                 |       **X**        |                  |
| **RN.02** |                      |        X         |                    |                   |                  |               |                |                    |                |                    |              |                |                   |               |              |                      |          X           |                      |                    |                        |                  |                 |                       |         X         |                 |                    |                  |
| **RN.03** |                      |                  |                    |                   |                  |               |                |                    |                |                    |              |       X        |         X         |               |              |          X           |          X           |                      |         X          |                        |                  |                 |           X           |                   |                 |                    |                  |
| **RN.04** |                      |                  |       **X**        |                   |                  |               |                |                    |                |                    |              |                |                   |               |              |                      |                      |                      |                    |                        |                  |                 |         **X**         |                   |                 |                    |                  |
| **RN.05** |          X           |                  |         X          |                   |                  |               |                |                    |                |                    |              |                |                   |               |              |                      |                      |                      |                    |                        |                  |                 |                       |                   |                 |                    |                  |
| **RN.06** |                      |                  |                    |         X         |                  |               |       X        |                    |                |                    |              |                |                   |               |              |                      |                      |                      |                    |                        |                  |                 |                       |                   |                 |                    |                  |
| **RN.07** |          X           |                  |         X          |                   |                  |               |                |                    |                |                    |              |                |                   |               |              |                      |                      |                      |                    |                        |                  |                 |         **X**         |                   |                 |                    |                  |
| **RN.08** |                      |                  |                    |                   |      **X**       |               |                |                    |                |                    |              |                |                   |               |              |                      |                      |                      |                    |                        |                  |                 |                       |                   |                 |                    |                  |
| **RN.09** |                      |                  |       **X**        |                   |                  |               |                |                    |                |                    |              |                |                   |               |              |                      |                      |                      |                    |                        |                  |                 |         **X**         |                   |                 |                    |                  |
| **RF.01** |          X           |        X         |                    |         X         |                  |               |                |                    |                |                    |              |                |                   |               |              |                      |                      |                      |                    |                        |        X         |                 |                       |                   |        X        |                    |        X         |
| **RF.02** |                      |        X         |                    |                   |        X         |       X       |       X        |                    |                |                    |              |       X        |         X         |               |              |          X           |          X           |                      |                    |                        |                  |                 |                       |         X         |        X        |                    |                  |
| **RF.03** |          X           |        X         |                    |                   |                  |               |                |                    |                |                    |              |                |                   |               |              |                      |                      |                      |                    |                        |                  |                 |                       |                   |        X        |                    |        X         |
| **RF.04** |                      |        X         |                    |                   |                  |       X       |                |                    |                |                    |              |                |                   |               |              |                      |                      |                      |         X          |           X            |                  |                 |                       |                   |                 |                    |                  |
| **RF.05** |          X           |                  |         X          |                   |                  |       X       |                |                    |                |                    |              |                |                   |               |              |                      |                      |                      |         X          |           X            |                  |                 |                       |                   |                 |                    |                  |
| **RF.06** |          X           |        X         |         X          |                   |                  |       X       |                |                    |                |                    |              |                |                   |               |              |                      |                      |                      |         X          |           X            |                  |                 |                       |                   |                 |                    |                  |
| **RF.07** |                      |                  |                    |         X         |        X         |               |                |         X          |                |         X          |              |                |                   |               |              |                      |                      |                      |                    |                        |                  |                 |                       |                   |                 |                    |                  |
| **RF.08** |          X           |                  |         X          |                   |                  |               |                |                    |                |                    |              |                |                   |               |              |                      |                      |                      |         X          |           X            |        X         |                 |                       |                   |        X        |                    |        X         |
| **RF.10** |                      |                  |                    |                   |                  |               |                |                    |                |                    |              |       X        |         X         |               |              |          X           |          X           |                      |                    |                        |                  |                 |                       |         X         |                 |                    |                  |


---


## 7. Modelo relacional en 3FN

A continuación se detallan las relaciones resultantes tras la transformación del Modelo Conceptual al Modelo Relacional, garantizando el cumplimiento de la **Tercera Forma Normal (3FN)**.


### Entidades Fuertes y Subclases

* **Usuario** (__<u>id_usuario</u>__, email, contrasena, nombreUsuario)
    * *AK: `email` *
* **Administrador** (__<u>id_usuario</u>__)
    * *FK: `id_usuario` referencia a `Usuario(id_usuario)`.*
* **Unidad** (__<u>id_unidad</u>__, indicativo, tipoUnidad, frecuenciaRadio, *id_policia_supervisa*)
    * *FK: `id_policia_supervisa` referencia a `Policia(id_usuario)`.*
    * *AK: `indicativo`*
* **Policia** (__<u>id_policia</u>__, *id_usuario*, numeroPlaca, rango, fechaIngreso, *id_unidad*)
    * *FK: `id_usuario` referencia a `Usuario(id_usuario)`.*
    * *FK: `id_unidad` referencia a `Unidad(id_unidad)`.*
    * *AK: `numeroPlaca`*
* **Zona** (__<u>id_zona</u>__, nombre, *id_unidad*)
    * *FK: `id_unidad` referencia a `Unidad(id_unidad)`.*
* **Persona** (__<u>id_persona</u>__, dni, nombre, apellido1, apellido2, direccionLinea1, direccionLinea2, situacionLaboral, fechaNacimiento, estadoCivil, estadoPersona, descripcion)
    * *AK: `dni`*
* **Delincuente** (__<u>id_persona</u>__, condenaDias, situacionProcesal, alias)
    * *FK: `id_persona` referencia a `Persona(id_persona)`.*
* **Aviso** (__<u>id_aviso</u>__, tipoAviso, codigoAviso, fecha, direccion, grado, transcripcionLlamada, *id_zona*, *id_unidad*, *id_emisor*)
    * *FK: `id_zona` referencia a `Zona(id_zona)`.*
    * *FK: `id_unidad` referencia a `Unidad(id_unidad)`.*
    * *FK: `id_emisor` referencia a `Persona(id_persona)`.*
* **Delito** (__<u>id_delito</u>__, codigoTipificacion, descripcion, fecha, estadoProcesal, *id_aviso*)
    * *FK: `id_aviso` referencia a `Aviso(id_aviso)`.*
* **Vehiculo** (__<u>id_vehiculo</u>__, matricula, tipo, modelo, color, estaAsegurado, anioFabricacion, robado, *id_unidad*, *id_propietario*)
    * *FK: `id_unidad` referencia a `Unidad(id_unidad)`.*
    * *FK: `id_propietario` referencia a `Persona(id_persona)`.*
    * *AK: `matricula`*
* **Licencia** (__<u>id_licencia</u>__, nombre)
* **Arma** (__<u>id_arma</u>__, numeroSerie, tipo, modelo, condicion, origen, *id_propietario*, *id_datos*)
    * *FK: `id_propietario` referencia a `Persona(id_persona)`.*
    * *FK: `id_datos` referencia a `Datos(id_datos)`.*
    * *AK: `numeroSerie`*
* **Evidencia** (__<u>id_evidencia</u>__, tipo, descripcion, estado, lugar, *id_delito*, *id_arma*)
    * *FK: `id_delito` referencia a `Delito(id_delito)`.*
    * *FK: `id_arma` referencia a `Arma(id_arma)`.*
* **Multimedia** (__<u>id_multimedia</u>__, extension, url, descripcion, *id_persona_foto*, *id_persona_huella*, *id_aviso*, *id_evidencia*)
    * *FK: `id_persona_foto` referencia a `Persona(id_persona)`.*
    * *FK: `id_persona_huella` referencia a `Persona(id_persona)`.*
    * *FK: `id_aviso` referencia a `Aviso(id_aviso)`.*
    * *FK: `id_evidencia` referencia a `Evidencia(id_evidencia)`.*

### Relaciones N:M (Tablas Intermedias)

* **Datos** (__<u>id_datos</u>__, *id_persona*, fechaEmision, fechaValidez, *id_licencia*)
    * *FK: `id_persona` referencia a `Persona(id_persona)`.*
    * *FK: `id_licencia` referencia a `Licencia(id_licencia)`.*
* **Rel_Persona_Delito** (__<u>id_persona</u>__, __<u>id_delito</u>__, rol)
    * *FK: `id_persona` referencia a `Persona(id_persona)`.*
    * *FK: `id_delito` referencia a `Delito(id_delito)`.*
* **Rel_Vehiculo_Delito** (__<u>id_vehiculo</u>__, __<u>id_delito</u>__)
    * *FK: `id_vehiculo` referencia a `Vehiculo(id_vehiculo)`.*
    * *FK: `id_delito` referencia a `Delito(id_delito)`.*
* **Rel_Policia_Delito** (__<u>id_policia</u>__, __<u>id_delito</u>__)
    * *FK: `id_policia` referencia a `Policia(id_usuario)`.*
    * *FK: `id_delito` referencia a `Delito(id_delito)`.*
* **Rel_Familiar** (__<u>id_persona</u>__, __<u>id_familiar</u>__, tipo_parentesco)
    * *FK: `id_persona` referencia a `Persona(id_persona)`.*
    * *FK: `id_familiar` referencia a `Persona(id_persona)`.*

---

### 7.1. Justificación de la estrategia de transformación de jerarquías


En el análisis del Modelo Conceptual se identificaron dos jerarquías de generalización/especialización claras:

1. **Usuario (Superclase)** $\rightarrow$ **Policia**, **Administrador** (Subclases).
2. **Persona (Superclase)** $\rightarrow$ **Delincuente** (Subclase).

Para ambas jerarquías, al analizar la estructura DDL generada, se optó por la estrategia de **una tabla por cada clase de la jerarquía**.

**Justificación técnica de la elección:**

1. **Eliminación de Nulos (Eficiencia de Espacio y Semántica):**

   * Al utilizar tablas separadas como `Administrador`, `Policia` y `Delincuente`, se evita la creación de una única tabla grande para la superclase que contendría numerosos atributos con valores `NULL` para instancias que no correspondan a ese tipo. Si se almacenaran todos los atributos en una sola tabla `Usuario`, un `Administrador` tendría campos como `numeroPlaca` o `rango` (propios de `Policia`) con valor nulo. Con la estrategia adoptada, cada tabla contiene únicamente los atributos relevantes para su tipo.

2. **Mantenimiento de la 3FN (Integridad de Datos):**

   * Esta estrategia favorece el cumplimiento de la Tercera Forma Normal (3FN). Al separar los atributos específicos de cada subclase, se evitan dependencias funcionales parciales o transitivas que podrían aparecer si se combinaran atributos de `Delincuente` junto con los atributos generales de `Persona` en una misma tabla.

3. **Integridad Referencial Robusta:**

   * La integridad se garantiza mediante relaciones uno a uno entre la superclase y la subclase, donde la clave primaria de la subclase es, a su vez, clave foránea que referencia a la superclase. Por ejemplo, en la tabla `Delincuente`, el atributo `id_persona` actúa simultáneamente como clave primaria y como clave foránea hacia la tabla `Persona`, al igual que en la tabla `Policia`, que se introduce una clave subrogada `id_policia` para facilitar la operativa del sistema, pero se mantiene la relación correcta mediante el atributo `id_usuario`, que asegura que todo policía esté registrado previamente como usuario del sistema.

4. **Extensibilidad del Modelo:**

   * En caso de que el dominio evolucione y sea necesario incorporar nuevos tipos de usuarios u otros roles derivados de `Persona`, esta estrategia permite añadir nuevas tablas enlazadas a la superclase sin modificar la estructura de las tablas existentes, preservando tanto los datos almacenados como la compatibilidad con las aplicaciones actuales.


---

## 8. Matriz de trazabilidad MC/SQL

-Restricciones sobre el MC -> SQL, incluyendo relaciones entre clases, tablas, triggers y constraints.

| Elemento SQL (Fila)                   | Tipo       | E:Persona | E:Delito | E:Vehículo | E:Evidencia | E:Aviso | E: Unidad | E:Arma | E:Policía | E:Datos | E: Zona | E:Licencia | E:Multimedia | E:Usuario | E:Delincuente | A:Delin-Delito | A:Pol-Delito (Investiga) | A:Evi-Delito | A:Vehí-Delito | A: Arma-Delito | A:Aviso-Delito | A:Veh-Pers | A:Arma-Pers | A: Pers-Lic (Tiene) | A:Datos-Arma | A: Uni-Aviso | A: Uni-Veh | A:Uni-Zona | A:Aviso-Zona | A:Pol-Uni (Pertenece) | A:Pol-Uni (Supervisa) | A:Multi-Ref (XOR) | R:Herencia (Is-A) | R:Cardinalidad/Restriccion |
| ------------------------------------- | ---------- | --------- | -------- | ---------- | ----------- | ------- | --------- | ------ | --------- | ------- | ------- | ---------- | ------------ | --------- | ------------- | -------------- | ------------------------ | ------------ | ------------- | -------------- | -------------- | ---------- | ----------- | ------------------- | ------------ | ------------ | ---------- | ---------- | ------------ | --------------------- | --------------------- | ----------------- | ----------------- | -------------------------- |
| TABLA: Usuario                        | Tabla      |           |          |            |             |         |           |        |           |         |         |            |              | X         |               |                |                          |              |               |                |                |            |             |                     |              |              |            |            |              |                       |                       |                   |                   | X                          |
| TABLA: Administrador                  | Tabla      |           |          |            |             |         |           |        |           |         |         |            | X            |           |               |                |                          |              |               |                |                |            |             |                     |              |              |            |            |              |                       |                       |                   | X                 |                            |
| TABLA: Policia                        | Tabla      |           |          |            |             |         |           | X      |           |         |         |            |              |           |               | X              |                          |              |               |                |                |            |             |                     |              |              |            | X          |              | X                     |                       |                   |                   |
| TABLA: Unidad                         | Tabla      |           |          |            |             |         | X         |        |           |         |         |            |              |           |               |                |                          |              |               |                |                |            |             |                     |              |              |            | X          | X            |                       |                       | X                 |                   |                            |
| TABLA: Zona                           | Tabla      |           |          |            |             |         |           |        |           | X       |         |            |              |           |               |                |                          |              |               |                |                |            |             |                     |              |              |            | X          | X            |                       |                       |                   |                   |                            |
| TABLA: Persona                        | Tabla      | X         |          |            |             |         |           |        |           |         |         |            |              |           |               |                |                          |              |               |                |                |            |             |                     |              |              |            |            |              |                       |                       |                   |                   |                            |   |
| TABLA: Delincuente                    | Tabla      |           |          |            |             |         |           |        |           |         |         |            |              | X         |               |                |                          |              |               |                |                |            |             |                     |              |              |            |            |              |                       |                       |                   | X                 |                            |
| TABLA:  Aviso                         | Tabla      |           |          |            |             | X       |           |        |           |         |         |            |              |           | X             |                |                          |              |               |                | X              |            |             |                     |              | X            |            | X          | X            |                       |                       |                   |                   |                            |
| TABLA: Delito                         | Tabla      |           | X        |            |             |         |           |        |           |         |         |            |              |           |               |                |                          |              |               | X              |                |            |             |                     |              |              |            |            |              |                       |                       |                   |                   |                            |
| TABLA: Vehiculo                       | Tabla      |           |          | X          |             |         |           |        |           |         |         |            |              |           |               |                |                          |              |               |                |                | X          |             |                     |              |              |            | X          |              |                       |                       |                   |                   |                            |
| TABLA: Licencia                       | Tabla      |           |          |            |             |         |           |        |           |         | X       |            |              |           |               |                |                          |              |               |                |                |            |             |                     |              |              |            |            |              |                       |                       |                   |                   |                            |
| TABLA: Datos                          | Tabla      |           |          |            |             |         |           |        | X         |         |         |            |              |           |               |                |                          |              |               |                |                | X          | X           |                     |              |              |            |            |              |                       |                       |                   |                   |                            |
| TABLA: Arma                           | Tabla      |           |          |            |             |         | X         |        |           |         |         |            |              |           |               |                |                          |              |               |                | X              | X          |             |                     |              |              | X          |            |              |                       |                       |                   |                   |                            |
| TABLA: Evidencia                      | Tabla      |           |          |            | X           |         |           |        |           |         |         |            |              |           |               |                |                          | X            |               |                |                |            |             |                     |              |              |            |            |              |                       |                       |                   |                   |                            |
| TABLA: Multimedia                     | Tabla      |           |          |            |             |         |           |        |           |         |         | X          |              |           |               |                |                          |              |               |                |                |            |             |                     |              |              |            |            |              |                       |                       |                   | X                 |                            |
| TABLA: Relación_Persona_Delito        | Tabla      | X         | X        |            |             |         |           |        |           |         |         |            |              |           |               | X              |                          |              |               |                |                |            |             |                     |              |              |            |            |              |                       |                       |                   |                   |                            |
| TABLA: Relación_Vehiculo_Delito       | Tabla      |           | X        | X          |             |         |           |        |           |         |         |            |              |           |               |                | X                        |              |               |                |                |            |             |                     |              |              |            |            |              |                       |                       |                   |                   |                            |
| TABLA:  Relación_Policia_Delito       | Tabla      |           | X        |            |             |         |           | X      |           |         |         |            |              |           |               | X              |                          |              |               |                |                |            |             |                     |              |              |            |            |              |                       |                       |                   |                   |                            |
| TABLA: Relación_Familiar              | Tabla      | X         |          |            |             |         |           |        |           |         |         |            |              |           |               |                |                          |              |               |                |                |            |             |                     |              |              |            |            |              |                       |                       |                   |                   |                            |   |
| TRIG: CHECK RANGO SUPERVISOR          | Trigger    |           |          |            |             |         | X         |        | X         |         |         |            |              |           |               |                |                          |              |               |                |                |            |             |                     |              |              |            |            |              |                       | X                     |                   | X                 |                            |
| TRIG: BLOQUEO MANIPULACIÓN EVIDENCIAS | Trigger    |           | X        |            | X           |         |           |        |           |         |         |            |              |           |               |                | X                        |              |               |                |                |            |             |                     |              |              |            |            |              |                       |                       |                   |                   | X                          |
| TRIG: IMPEDIR BORRADO DELITO          | Trigger    |           | X        |            |             |         |           |        |           |         |         |            |              |           |               |                |                          |              |               |                |                |            |             |                     |              |              |            |            |              |                       |                       |                   |                   | X                          |
| TRIG: DELITO GENERA AVISO             | Trigger    | X         | X        | X          |             | X       |           |        |           |         |         |            |              |           |               |                |                          | X            |               | X              | X              |            |             |                     |              |              |            |            |              |                       |                       |                   |                   |                            |
| TRIG: COMPROBAR RESOLUCIÓN            | Trigger    |           | X        |            | X           |         |           |        |           |         |         |            |              | X         | X             |                | X                        |              |               |                |                |            |             |                     |              |              |            |            |              |                       |                       |                   |                   | X                          |
| TRIG: CHECK PERSONA EN DELITO         | Trigger    | X         | X        |            |             |         |           |        |           |         |         |            |              |           |               | X              |                          |              |               |                |                |            |             |                     |              |              |            |            |              |                       |                       |                   |                   | X                          |
| TRIG: CHECK EVIDENCIA EN DELITO       | Trigger    |           | X        |            | X           |         |           |        |           |         |         |            |              |           |               |                | X                        |              |               |                |                |            |             |                     |              |              |            |            |              |                       |                       |                   |                   | X                          |
| TRIG: CHECK MÍNIMO AGENTES UNIDAD     | Trigger    |           |          |            |             | X       | X         |        | X         |         |         |            |              |           |               |                |                          |              |               |                |                | X          |             |                     |              |              |            |            |              | X                     |                       |                   |                   | X                          |
| TRIG: VALIDACIÓN MATRÍCULA            | Trigger    |           |          | X          |             |         |           |        |           |         |         |            |              |           |               |                |                          |              |               |                |                |            |             |                     |              |              |            |            |              |                       |                       |                   |                   | X                          |
| TRIG: VALIDAR MULTIMEDIA ÚNICA        | Trigger    |           |          |            |             |         |           |        |           |         |         | X          |              |           |               |                |                          |              |               |                |                |            |             |                     |              |              |            |            |              |                       |                       |                   | X                 |                            | X |
| FK: FK PERSONA ES DELINCUENTE         | Constraint | X         |          |            |             |         |           |        |           |         |         |            |              | X         |               |                |                          |              |               |                |                |            |             |                     |              |              |            |            |              |                       |                       |                   |                   | X                          |   |
| FK: FK POLICÍA EN UNIDAD              | Constraint |           |          |            |             |         | X         |        | X         |         |         |            |              |           |               |                |                          |              |               |                |                |            |             |                     |              |              | X          |            |              |                       |                       |                   |                   |                            |
| FK: FK SUPERVISOR SUPERVISA UNIDAD    | Constraint |           |          |            |             |         | X         |        | X         |         |         |            |              |           |               |                |                          |              |               |                |                |            |             |                     |              |              |            |            |              | X                     |                       |                   |                   |                            |
| FK: FK AVISO EN ZONA                  | Constraint |           |          |            |             | X       |           |        |           | X       |         |            |              |           |               |                |                          |              |               |                |                |            |             |                     |              |              |            |            |              | X                     |                       |                   |                   |                            |   |
| FK: FK DATOS DE ARMA                  | Constraint |           |          |            |             |         |           | X      |           | X       |         |            |              |           |               |                |                          |              |               |                |                | X          |             |                     |              |              |            |            |              |                       |                       |                   |                   |                            |   |
| CK: CK TIPO DE VEHÍCULO               | Constraint |           |          | X          |             |         |           |        |           |         |         |            |              |           |               |                |                          |              |               |                |                |            |             |                     |              |              |            |            |              |                       |                       |                   |                   |                            | X |
| CK: CK ESTADO PERSONA                 | Constraint | X         |          |            |             |         |           |        |           |         |         |            |              |           |               |                |                          |              |               |                |                |            |             |                     |              |              |            |            |              |                       |                       |                   |                   |                            | X |
