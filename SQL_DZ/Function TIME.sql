DELIMITER $$
CREATE FUNCTION int_to_time (seconds BIGINT) -- первый вариант - просто по ТЗ
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
    DECLARE days INT;
    DECLARE hours INT;
    DECLARE minutes INT;
    DECLARE secs INT;
    DECLARE result VARCHAR(100);

    SET days = FLOOR(seconds / 86400);
    SET hours = FLOOR((seconds % 86400) / 3600);
    SET minutes = FLOOR((seconds % 3600) / 60);
    SET secs = seconds % 60;

    SET result = CONCAT(days, ' days ', hours, ' hours ', minutes, ' minutes ', secs, ' seconds');
    RETURN result;
END $$
DELIMITER ;

SELECT int_to_time (12) AS time;

DELIMITER $$
CREATE FUNCTION int_to_time2 (seconds BIGINT) -- второй вариант - пропускаем нулевые значения, обрабатываем отрицательные
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
    DECLARE days INT;
    DECLARE hours INT;
    DECLARE minutes INT;
    DECLARE secs INT;
    DECLARE result VARCHAR(100);
    
    IF seconds < 0 THEN
        RETURN 'Необходимо было ввести не отрицательное число';
    END IF;

    SET days = FLOOR(seconds / 86400);
    SET hours = FLOOR((seconds % 86400) / 3600);
    SET minutes = FLOOR((seconds % 3600) / 60);
    SET secs = seconds % 60;

    SET result = '';

    IF days > 0 THEN
        SET result = CONCAT(result, days, ' days ');
    END IF;

    IF hours > 0 THEN
        SET result = CONCAT(result, hours, ' hours ');
    END IF;

    IF minutes > 0 THEN
        SET result = CONCAT(result, minutes, ' minutes ');
    END IF;

    IF secs > 0 THEN
        SET result = CONCAT(result, secs, ' seconds');
    END IF;

    RETURN TRIM(result);
END $$
DELIMITER ;

SELECT int_to_time2 (123) AS time;


