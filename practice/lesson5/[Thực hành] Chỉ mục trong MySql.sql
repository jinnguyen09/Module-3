use classicmodels;

SELECT * FROM customers WHERE customerName = 'Land of Toys Inc.'; 
EXPLAIN SELECT * FROM customers WHERE customerName = 'Land of Toys Inc.'; 

alter table customers add index idx_customername(customername);

ALTER TABLE customers ADD INDEX idx_full_name(contactFirstName, contactLastName);
EXPLAIN SELECT * FROM customers WHERE contactFirstName = 'Jean' or contactFirstName = 'King';
ALTER TABLE customers DROP INDEX idx_full_name;
