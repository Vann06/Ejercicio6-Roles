
-- Activar RLS
ALTER TABLE usuarios ENABLE ROW LEVEL SECURITY;
ALTER TABLE productos ENABLE ROW LEVEL SECURITY;
ALTER TABLE pedidos ENABLE ROW LEVEL SECURITY;

-- SELECT
CREATE POLICY select_usuarios ON usuarios FOR SELECT
  USING (tenant_id = current_setting('app.tenant_id')::int);

CREATE POLICY select_productos ON productos FOR SELECT
  USING (tenant_id = current_setting('app.tenant_id')::int);

CREATE POLICY select_pedidos ON pedidos FOR SELECT
  USING (tenant_id = current_setting('app.tenant_id')::int);

-- INSERT
CREATE POLICY insert_usuarios ON usuarios FOR INSERT
  WITH CHECK (tenant_id = current_setting('app.tenant_id')::int);

CREATE POLICY insert_productos ON productos FOR INSERT
  WITH CHECK (tenant_id = current_setting('app.tenant_id')::int);

CREATE POLICY insert_pedidos ON pedidos FOR INSERT
  WITH CHECK (tenant_id = current_setting('app.tenant_id')::int);

-- UPDATEPolíticas UPDATE
CREATE POLICY update_usuarios ON usuarios FOR UPDATE USING (tenant_id = current_setting('app.tenant_id')::int);
CREATE POLICY update_productos ON productos FOR UPDATE USING (tenant_id = current_setting('app.tenant_id')::int);
CREATE POLICY update_pedidos ON pedidos FOR UPDATE USING (tenant_id = current_setting('app.tenant_id')::int);

-- DELETE
- Políticas DELETE
CREATE POLICY delete_usuarios ON usuarios FOR DELETE USING (tenant_id = current_setting('app.tenant_id')::int);
CREATE POLICY delete_productos ON productos FOR DELETE USING (tenant_id = current_setting('app.tenant_id')::int);
CREATE POLICY delete_pedidos ON pedidos FOR DELETE USING (tenant_id = current_setting('app.tenant_id')::int);

-- Configurar el tenant_id de sesión para cada rol
ALTER ROLE rol_novabio_asistente SET app.tenant_id = '1';
ALTER ROLE rol_aurum_analista SET app.tenant_id = '2';
ALTER ROLE rol_celestis_tecnico SET app.tenant_id = '3';
ALTER ROLE rol_terra_ingeniero SET app.tenant_id = '4';
