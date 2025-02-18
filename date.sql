create table time_zone_test (ts timestamp without time zone,tsz timestamp with time zone);

insert into time_zone_test VALUES ('2025-02-18 10:00:00','2025-02-18 10:00:00');

select * from time_zone_test;
