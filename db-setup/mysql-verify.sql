-- Check if schemas exist
SELECT schema_name
FROM information_schema.schemata
WHERE schema_name IN ('order_schema', 'identity_schema', 'catalog_schema');

-- Check if tables exist in 'order_schema'
SELECT table_name
FROM information_schema.tables
WHERE table_schema = 'order_schema' AND table_name = 'orders';

-- Check if tables exist in 'identity_schema'
SELECT table_name
FROM information_schema.tables
WHERE table_schema = 'identity_schema' AND table_name = 'users';

-- Check if tables exist in 'catalog_schema'
SELECT table_name
FROM information_schema.tables
WHERE table_schema = 'catalog_schema' AND table_name = 'products';

-- Check if users exist
SELECT user
FROM mysql.user
WHERE user IN ('order_user', 'identity_user', 'catalog_read_user', 'catalog_write_user');

