-- Rollback script for users and privileges
DROP USER IF EXISTS 'order_user'@'%';
DROP USER IF EXISTS 'identity_user'@'%';
DROP USER IF EXISTS 'catalog_user'@'%';

-- Rollback script for schema creation
DROP SCHEMA IF EXISTS order_schema;
DROP SCHEMA IF EXISTS identity_schema;
DROP SCHEMA IF EXISTS catalog_schema;
