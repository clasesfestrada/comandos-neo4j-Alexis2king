MERGE (e:Estudiante {id: 'E0000'})
SET e.nombre = 'Alexis',
    e.carrera = 'Sistemas',
    e.semestre = 2;


MATCH (e:Estudiante {id: 'E0000'})
MATCH (m:Materia {id: 'A0001'})
CREATE (e)-[:INSCRITO_EN]->(m);

MATCH (e:Estudiante)
RETURN e.id, e.nombre, e.carrera, e.semestre;

MATCH (m:Materia)
RETURN m.id, m.nombre, m.area;

MATCH (e:Estudiante)-[r]->(n)
RETURN e.nombre, type(r), n;

MATCH (e:Estudiante {id: 'E0000'})
SET e.semestre = 3;

MATCH (e:Estudiante {id: 'E0000'})-[r:INSCRITO_EN]->(m:Materia {id: 'A0001'})
DELETE r;

MATCH (e:Estudiante {id: 'E0000'})
DELETE e;

MATCH (e:Estudiante {id: 'E0000'})
DETACH DELETE e;