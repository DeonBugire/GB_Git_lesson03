DELIMITER $$
CREATE PROCEDURE print_even_numbers(IN n INT)
BEGIN
    DECLARE i INT DEFAULT 4;
    DECLARE res VARCHAR(100) DEFAULT '2';
    IF n <= 0 THEN
        SELECT 'Необходимо ввести положительное число' AS message;
	ELSEIF n = 1 THEN
        SELECT 'В промежутке нет четных чисел' AS message;
	ELSEIF n = 2 THEN
        SELECT(res);
    ELSE
        WHILE i <= n DO
            SET res = CONCAT(res, ' ', i);
            SET i = i + 2;
        END WHILE;
        SELECT(res);
    END IF;
END $$
DELIMITER ;


CALL print_even_numbers(3);



