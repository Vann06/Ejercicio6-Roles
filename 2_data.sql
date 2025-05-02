
-- Datos de prueba para 4 tenants 

INSERT INTO tenants (nombre) VALUES
('NovaBiotic Labs'),
('Aurum Digital Ventures'),
('Celestis AeroSpace'),
('TerraAgro Systems');

-- Usuarios
INSERT INTO usuarios (nombre, apellido, telefono, correo, tenant_id) VALUES
('Ana', 'Morales', '5010-0011', 'ana@novabio.com', 1),
('Carlos', 'Lemus', '5010-0012', 'carlos@novabio.com', 1),
('Luis', 'Salazar', '5020-0021', 'luis@aurum.com', 2),
('Marcela', 'Reyes', '5020-0022', 'marcela@aurum.com', 2),
('Sofía', 'Cruz', '5030-0031', 'sofia@celestis.com', 3),
('Daniel', 'Mendoza', '5030-0032', 'daniel@celestis.com', 3),
('Andrés', 'Guzmán', '5040-0041', 'andres@terra.com', 4),
('Patricia', 'López', '5040-0042', 'patricia@terra.com', 4);

-- Productos
INSERT INTO productos (nombre, descripcion, precio, cantidad_disponible, tenant_id) VALUES
('Kit ADN', 'Prueba genética personal', 120.00, 30, 1),
('Microscopio Pro', 'Alta resolución', 850.00, 10, 1),
('Simulador Blockchain', 'Software de simulación de trading', 600.00, 25, 2),
('Asistente IA', 'IA para análisis financiero', 1500.00, 8, 2),
('Sensor Orbital', 'Sensor satelital experimental', 3000.00, 3, 3),
('Panel Solar Modular', 'Alta eficiencia', 4200.00, 4, 3),
('Dron de Riego', 'Dron agrícola con sensores', 1300.00, 5, 4),
('Estación Meteorológica', 'Sistema para cultivos', 800.00, 7, 4);

-- Insertar pedidos
INSERT INTO pedidos (usuario_id, tenant_id, fecha, estado, total) VALUES
(1, 1, NOW(), 'pendiente', 30.00), -- Pedido de Ana
(3, 3, NOW(), 'enviado', 550.00),  -- Pedido de Carla
(2, 4, NOW(), 'pendiente', 970.00),
(4, 5, NOW(), 'procesado', 1500.00);


-- Insertar detalles de pedidos
INSERT INTO detalles_pedidos (id_pedido, id_producto, cantidad, precio_unitario, subtotal) VALUES
(1, 1, 2, 10.00, 20.00),  -- Ana compró 2 camisetas
(1, 2, 1, 10.00, 10.00),  -- Ana compró 1 pantalón
(2, 3, 1, 550.00, 550.00);-- Carla compró 1 laptop

-- Insertar pagos
INSERT INTO pagos (id_pedido, monto, fecha_pago) VALUES
(1, 30.00, NOW()),
(3, 970.00,NOW()),
(2, 550.00, NOW());