MATCH (ana:Estudiante {nombre: "Ana"})-[:AMIGO_DE]->(amigo:Estudiante)
RETURN amigo.nombre AS amigo_directo;

MATCH (ana:Estudiante {nombre: "Ana"})-[:AMIGO_DE]->(amigo:Estudiante)-[:INSCRITO_EN]->(m:Materia)
RETURN amigo.nombre AS amigo, m.nombre AS materia;

MATCH (ana:Estudiante {nombre: "Ana"})-[:AMIGO_DE]->(amigo:Estudiante)-[:INSCRITO_EN]->(m:Materia)<-[:IMPARTE]-(p:Profesor)
RETURN amigo.nombre AS amigo, m.nombre AS materia, p.nombre AS profesor;

MATCH (ana:Estudiante {nombre: "Ana"})-[:AMIGO_DE*1..2]->(conectado:Estudiante)
RETURN DISTINCT conectado.nombre AS estudiante_conectado;

MATCH (e:Estudiante)-[r:INSCRITO_EN]->(m:Materia)
WHERE r.calificacion >= 90
RETURN e.nombre AS estudiante, m.nombre AS materia, r.calificacion AS calificacion;