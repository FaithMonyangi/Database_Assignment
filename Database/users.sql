
-- ==============================================
-- 1. Create Roles (Representing Access Levels)
-- ==============================================
-- Using IF NOT EXISTS to avoid errors if run multiple times
CREATE ROLE IF NOT EXISTS
    'admin_role'@'localhost',
    'order_management_role'@'localhost',
    'inventory_management_role'@'localhost',
    'read_only_role'@'localhost';

-- ==============================================
-- 2. Grant Privileges to Roles for bookstore_db
-- ==============================================

-- Grant necessary USAGE privilege (allows connecting but no specific table access yet)
GRANT USAGE ON bookstore_db.* TO
    'admin_role'@'localhost',
    'order_management_role'@'localhost',
    'inventory_management_role'@'localhost',
    'read_only_role'@'localhost';

-- --- Admin Role ---
-- Full privileges on the specific database
GRANT ALL PRIVILEGES ON bookstore_db.* TO 'admin_role'@'localhost';

-- --- Order Management Role ---
-- SELECT access to reference data
GRANT SELECT ON bookstore_db.book TO 'order_management_role'@'localhost'; -- To see book details
GRANT SELECT ON bookstore_db.order_status TO 'order_management_role'@'localhost';
GRANT SELECT ON bookstore_db.shipping_method TO 'order_management_role'@'localhost';
GRANT SELECT ON bookstore_db.address_status TO 'order_management_role'@'localhost';
GRANT SELECT ON bookstore_db.country TO 'order_management_role'@'localhost';

-- SELECT, INSERT, UPDATE on core order/customer tables
GRANT SELECT, INSERT, UPDATE ON bookstore_db.customer TO 'order_management_role'@'localhost';
GRANT SELECT, INSERT, UPDATE ON bookstore_db.address TO 'order_management_role'@'localhost';
GRANT SELECT, INSERT, UPDATE ON bookstore_db.customer_address TO 'order_management_role'@'localhost';
GRANT SELECT, INSERT, UPDATE ON bookstore_db.cust_order TO 'order_management_role'@'localhost';
GRANT SELECT, INSERT, UPDATE ON bookstore_db.order_line TO 'order_management_role'@'localhost';
GRANT SELECT, INSERT, UPDATE ON bookstore_db.order_history TO 'order_management_role'@'localhost';

-- Optionally allow updating book stock (be cautious with broad UPDATE)
GRANT UPDATE (stock) ON bookstore_db.book TO 'order_management_role'@'localhost'; -- More specific if needed/supported easily
-- Or grant full update if column-level is complex/not desired:
-- GRANT UPDATE ON bookstore_db.book TO 'order_management_role'@'localhost';

-- --- Inventory Management Role ---
-- Full CRUD on catalog tables
GRANT SELECT, INSERT, UPDATE, DELETE ON bookstore_db.book TO 'inventory_management_role'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON bookstore_db.author TO 'inventory_management_role'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON bookstore_db.book_author TO 'inventory_management_role'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON bookstore_db.publisher TO 'inventory_management_role'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON bookstore_db.book_language TO 'inventory_management_role'@'localhost';

-- SELECT access to see which books are ordered
GRANT SELECT ON bookstore_db.order_line TO 'inventory_management_role'@'localhost';

-- --- Read Only Role ---
-- SELECT access to all tables in the database
GRANT SELECT ON bookstore_db.* TO 'read_only_role'@'localhost';

-- ==============================================
-- 3. Create Users (Representing Individuals or Groups)
-- ==============================================
-- Replace 'StrongPassword...' with actual secure passwords!
CREATE USER IF NOT EXISTS 'db_admin_user'@'localhost' IDENTIFIED BY 'StrongAdminPassword1!';
CREATE USER IF NOT EXISTS 'order_processor_jane'@'localhost' IDENTIFIED BY 'StrongOrderPassword2!';
CREATE USER IF NOT EXISTS 'inventory_manager_john'@'localhost' IDENTIFIED BY 'StrongInventoryPassword3!';
CREATE USER IF NOT EXISTS 'reporting_analyst'@'localhost' IDENTIFIED BY 'StrongReadOnlyPassword4!';

-- ==============================================
-- 4. Assign Roles to Users
-- ==============================================
GRANT 'admin_role'@'localhost' TO 'db_admin_user'@'localhost';
GRANT 'order_management_role'@'localhost' TO 'order_processor_jane'@'localhost';
GRANT 'inventory_management_role'@'localhost' TO 'inventory_manager_john'@'localhost';
GRANT 'read_only_role'@'localhost' TO 'reporting_analyst'@'localhost';

-- ==============================================
-- 5. Set Default Roles (Optional but Recommended)
-- ==============================================
-- This makes the granted role automatically active when the user logs in.
-- Without this, users might need to run `SET ROLE 'role_name';` after connecting.
SET DEFAULT ROLE 'admin_role'@'localhost' TO 'db_admin_user'@'localhost';
SET DEFAULT ROLE 'order_management_role'@'localhost' TO 'order_processor_jane'@'localhost';
SET DEFAULT ROLE 'inventory_management_role'@'localhost' TO 'inventory_manager_john'@'localhost';
SET DEFAULT ROLE 'read_only_role'@'localhost' TO 'reporting_analyst'@'localhost';

-- ==============================================
-- 6. Apply Changes
-- ==============================================
FLUSH PRIVILEGES;

-- ==============================================
-- Verification (Optional)
-- ==============================================
-- SHOW GRANTS FOR 'order_processor_jane'@'localhost';
-- SHOW GRANTS FOR 'order_processor_jane'@'localhost' USING 'order_management_role'@'localhost';

-- SHOW GRANTS FOR 'inventory_manager_john'@'localhost';
-- SHOW GRANTS FOR 'inventory_manager_john'@'localhost' USING 'inventory_management_role'@'localhost';

-- SHOW GRANTS FOR 'reporting_analyst'@'localhost';
-- SHOW GRANTS FOR 'reporting_analyst'@'localhost' USING 'read_only_role'@'localhost';

-- SHOW GRANTS FOR 'db_admin_user'@'localhost';
-- SHOW GRANTS FOR 'db_admin_user'@'localhost' USING 'admin_role'@'localhost';

SELECT 'User and Role setup complete.' AS Status;

