# pg_doctestify Demo

This is a simple test, It doesn't do anything special.
``` postgres-console
select version();
                                                       version                                                       
---------------------------------------------------------------------------------------------------------------------
 PostgreSQL 17.5 (Debian 17.5-1.pgdg120+1) on x86_64-pc-linux-gnu, compiled by gcc (Debian 12.2.0-14) 12.2.0, 64-bit
(1 row)
```
## Another simple thing
``` postgres-console
select * from generate_series(1, 10);
 generate_series 
-----------------
               1
               2
               3
               4
               5
               6
               7
               8
               9
              10
(10 rows)
```

The source for this test is [sql/demo.sql](https://github.com/michelp/pg_doctestify/blob/main/sql/demo.sql).
The rendered markdown is [docs/demo.md](https://github.com/michelp/pg_doctestify/blob/main/docs/demo.md)