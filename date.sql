create table time_zone_test (ts timestamp without time zone,tsz timestamp with time zone);

insert into time_zone_test VALUES ('2025-02-18 10:00:00','2025-02-18 10:00:00');

select * from time_zone_test;

-- Interval 

select CURRENT_DATE + INTERVAL '100 days';

select CURRENT_DATE + INTERVAL '100 days' + INTERVAL '10 hours';

select CURRENT_DATE + INTERVAL '100 days' + INTERVAL '10 hours' + INTERVAL '10 minutes';


-- extract

select extract(year from timestamp '2025-02-18 10:00:00');

select extract(month from timestamp '2025-02-18 10:00:00');

-- age

select age(timestamp '2025-02-18 10:00:00', timestamp '2025-02-17 10:00:00');

select age(timestamp '2025-02-18 10:00:00', timestamp '2025-02-17 10:00:00');

-- to_char

SELECT to_char(now(),'dd-mm-yyyy');