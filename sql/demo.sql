-- # pg_doctestify Demo
--
-- This is a simple test, It doesn't do anything special.
select version();
-- ## Another simple thing
select * from generate_series(1, 10);
--
-- The source for this test is [sql/demo.sql](https://github.com/michelp/pg_doctestify/blob/main/sql/demo.sql).
-- The rendered markdown is [docs/demo.md](https://github.com/michelp/pg_doctestify/blob/main/docs/demo.md)
