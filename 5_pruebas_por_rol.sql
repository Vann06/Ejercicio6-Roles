-- PRUEBAS PARA EL ROL: rol_novabio_asistente (tenant_id = 1)

SET ROLE rol_novabio_asistente;
SET app.tenant_id = '1';
SELECT current_user;

-- SELECT válido (de su propio tenant)
SELECT * FROM productos;

-- SELECT inválido (otro tenant)
SELECT * FROM productos WHERE tenant_id = 2;

-- INSERT válido
INSERT INTO productos (nombre, descripcion, precio, cantidad_disponible, tenant_id)
VALUES ('Reactivo Gen X', 'Producto genético', 300.00, 10, 1);

-- INSERT inválido (otro tenant)
INSERT INTO productos (nombre, descripcion, precio, cantidad_disponible, tenant_id)
VALUES ('Acceso no permitido', 'Debe fallar', 999.00, 5, 2);

-- UPDATE válido (su propio producto)
UPDATE productos SET precio = 310.00 WHERE tenant_id = 1 ;

-- UPDATE inválido (otro tenant)
UPDATE productos SET precio = 9999.00 WHERE tenant_id = 2;

-- DELETE válido
DELETE FROM productos WHERE tenant_id = 1 ;

-- DELETE inválido
DELETE FROM productos WHERE tenant_id = 2;

--------------------------------------------------------------------------------

-- PRUEBAS PARA EL ROL: rol_aurum_analista (tenant_id = 2)

SET ROLE rol_aurum_analista;
SET app.tenant_id = '2';
SELECT current_user;

-- SELECT válido
SELECT * FROM productos;

-- SELECT inválido
SELECT * FROM productos WHERE tenant_id = 1;

-- INSERT válido
INSERT INTO productos (nombre, descripcion, precio, cantidad_disponible, tenant_id)
VALUES ('Simulador Económico', 'Sistema de inversión', 1500.00, 2, 2);

-- INSERT inválido
INSERT INTO productos (nombre, descripcion, precio, cantidad_disponible, tenant_id)
VALUES ('Error permitido', 'Debe fallar', 1.00, 1, 1);

-- UPDATE válido
UPDATE productos SET precio = 1400.00 WHERE tenant_id = 2;

-- UPDATE inválido
UPDATE productos SET precio = 10.00 WHERE tenant_id = 1;

-- DELETE válido
DELETE FROM productos WHERE tenant_id = 2;

-- DELETE inválido
DELETE FROM productos WHERE tenant_id = 1;

--------------------------------------------------------------------------------

-- PRUEBAS PARA EL ROL: rol_celestis_tecnico (tenant_id = 3)

SET ROLE rol_celestis_tecnico;
SET app.tenant_id = '3';
SELECT current_user;

-- SELECT válido
SELECT * FROM productos;

-- SELECT inválido
SELECT * FROM productos WHERE tenant_id = 4;

-- INSERT válido
INSERT INTO productos (nombre, descripcion, precio, cantidad_disponible, tenant_id)
VALUES ('Módulo de Navegación', 'Tecnología aeroespacial', 8000.00, 1, 3);

-- INSERT inválido
INSERT INTO productos (nombre, descripcion, precio, cantidad_disponible, tenant_id)
VALUES ('Error externo', 'Debe fallar', 100.00, 1, 1);

-- UPDATE válido
UPDATE productos SET precio = 8200.00 WHERE tenant_id = 3;

-- UPDATE inválido
UPDATE productos SET precio = 5.00 WHERE tenant_id = 1;

-- DELETE válido
DELETE FROM productos WHERE tenant_id = 3;

-- DELETE inválido
DELETE FROM productos WHERE tenant_id = 1;

--------------------------------------------------------------------------------

-- PRUEBAS PARA EL ROL: rol_terra_ingeniero (tenant_id = 4)

SET ROLE rol_terra_ingeniero;
SET app.tenant_id = '4';
SELECT current_user;

-- SELECT válido
SELECT * FROM productos;

-- SELECT inválido
SELECT * FROM productos WHERE tenant_id = 1;

-- INSERT válido
INSERT INTO productos (nombre, descripcion, precio, cantidad_disponible, tenant_id)
VALUES ('Sensor de Riego', 'Tecnología de campo', 350.00, 3, 4);

-- INSERT inválido
INSERT INTO productos (nombre, descripcion, precio, cantidad_disponible, tenant_id)
VALUES ('Producto bloqueado', 'Debe fallar', 1.00, 1, 1);

-- UPDATE válido
UPDATE productos SET precio = 370.00 WHERE tenant_id = 4;

-- UPDATE inválido
UPDATE productos SET precio = 1.00 WHERE tenant_id = 2;

-- DELETE válido
DELETE FROM productos WHERE tenant_id = 4;

-- DELETE inválido
DELETE FROM productos WHERE tenant_id = 2;


