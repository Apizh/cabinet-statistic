/*1) Создайте функцию, которая принимает кол-во сек и формат их в кол-во дней часов.
Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '*/

CREATE OR REPLACE FUNCTION format_seconds(total_seconds INT)
RETURNS TEXT AS $$
DECLARE
    days INT;
    hours INT;
    minutes INT;
    seconds INT;
BEGIN
    days := total_seconds / 86400; -- 1 день = 86400 секунд
    hours := (total_seconds % 86400) / 3600; -- 1 час = 3600 секунд
    minutes := (total_seconds % 3600) / 60; -- 1 минута = 60 секунд
    seconds := total_seconds % 60; -- остаток - секунды

    RETURN days || ' days ' || hours || ' hours ' || minutes || ' minutes ' || seconds || ' seconds ';
END;
$$ LANGUAGE plpgsql;

/*Пример работы функции*/
SELECT format_seconds(123456) AS Result_of_the_function;


/*2) Выведите только чётные числа от 1 до 10.
Пример: 2,4,6,8,10*/

-- Если нужно было написать функцию
CREATE OR REPLACE FUNCTION get_even_numbers()
RETURNS TEXT AS $$
DECLARE
    even_numbers TEXT := '';
BEGIN
    SELECT string_agg(number::TEXT, ', ')
    INTO even_numbers
    FROM generate_series(1, 10) AS number
    WHERE number % 2 = 0;

    RETURN even_numbers;
END;
$$ LANGUAGE plpgsql;



-- Для проверки результата работы фунцкции расскомментировать строку ниже 
-- SELECT get_even_numbers() AS even_numbers;

/*Если можно было через генератор и вывод допускается в столбик то генератор пишу ниже в виде многострочного комментария*/

/*
SELECT number
FROM generate_series(1, 10) AS number
WHERE number % 2 = 0;
*/