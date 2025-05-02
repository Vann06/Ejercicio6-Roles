
-- Crear roles por tenant
CREATE ROLE rol_novabio_asistente LOGIN PASSWORD 'novabio123';
CREATE ROLE rol_aurum_analista LOGIN PASSWORD 'aurum456';
CREATE ROLE rol_celestis_tecnico LOGIN PASSWORD 'celestis789';
CREATE ROLE rol_terra_ingeniero LOGIN PASSWORD 'terra321';

-- Asignar permisos
GRANT SELECT, INSERT ON ALL TABLES IN SCHEMA public TO rol_novabio_asistente;
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA public TO rol_novabio_asistente;

GRANT SELECT, INSERT, UPDATE ON ALL TABLES IN SCHEMA public TO rol_aurum_analista;
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA public TO rol_aurum_analista;

GRANT SELECT ON ALL TABLES IN SCHEMA public TO rol_celestis_tecnico;
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA public TO rol_celestis_tecnico;

GRANT SELECT, INSERT, DELETE ON ALL TABLES IN SCHEMA public TO rol_terra_ingeniero;
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA public TO rol_terra_ingeniero;
