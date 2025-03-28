use classicmodels;

-- Tham số loại IN 
DELIMITER //
DROP PROCEDURE IF EXISTS `findAllCustomers`//
CREATE PROCEDURE findAllCustomers()
BEGIN
SELECT * FROM customers where customerNumber = 180;
END //

call findallcustomers();

delimiter //
create procedure getcusbyid(in cusnum int(1))
begin
select * from customers where customernumber = cusnum;
end //

call getcusbyid(398);

-- Tham số loại OUT 
DELIMITER //
CREATE PROCEDURE GetCustomersCountByCity(
    IN  in_city VARCHAR(50),
    OUT total INT
)
BEGIN
    SELECT COUNT(customerNumber)
    INTO total
    FROM customers
    WHERE city = in_city;
END//
DELIMITER ;

CALL GetCustomersCountByCity('Lyon',@total);
SELECT @total;

Delimiter //
create procedure getcustomercountbyid(
	in id int(11),
    out total int
)
begin 
	select count(customernumber) into total from customers where id = customernumber;
end//

call getcustomercountbyid('175', @total);
select @total;


-- Tham số loại INOUT 
DELIMITER //
CREATE PROCEDURE SetCounter(
    INOUT counter INT,
    IN inc INT
)

BEGIN
    SET counter = counter + inc;
END//
DELIMITER ;

SET @counter = 1;
CALL SetCounter(@counter,1); -- 2
CALL SetCounter(@counter,1); -- 3
CALL SetCounter(@counter,5); -- 8
SELECT @counter; -- 8