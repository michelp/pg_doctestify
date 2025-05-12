# pgdoctest
PostgreSQL Doctests

## Intro

Python has long had an awesome feature called
[doctests](https://docs.python.org/3/library/doctest.html) to test
"interactive" code examples, which work well not only to check the
functionality of Python code but also explain it and check it for
regression.

Postgres' comes with a handy command-line [regression
tool][https://www.postgresql.org/docs/7.1/regress.html) called
`pg_regress`.  It takes a SQL file, and an expected output, and runs
the SQL comparing it to the expected results.  Importantly, pg_regress
also passes the *comments* from the sql through to the output file.

So, if you format your sql file comments as markdown, you get a very
similar result as Python doctests.  You write tests, you write
comments with markdown in them, and a this tool will run pg_regress
and then transform the output file into a markdown file, complete with
formatting, including code blocks around the input and output sql.
This generated markdown can then be used with many common static site
generation tools, like mkdocs.

For some examples of this tool in real-world use, check out the
following projects:

  - [OneSparse](https://onesparse.com/docs.html) Postgres extension
    for the
    [SuiteSparse](https://people.engr.tamu.edu/davis/GraphBLAS.html)
    GraphBLAS Sparse Graph library

  - [pg_crdt](https://supabase.github.io/pg_crdt/automerge/) Postgres
    extension for the [automerge](https://automerge.org/) CDRT library

## Usage

This tool is not itself an extension but rather a Python script
included in this distribution.  It does contains a small pointless
sample extension with a Makefile for building it and the documentation
which uses the script.

There is no installation, you copy the script into your project and
update your own Makefile to fit it into an existing extension.  Tested
on Python 3.10 but should work with any reasonably modern Python 3.

There is a [Dockerfile](./Dockerfile) that sets up and runs the tests
and runs mkdocs.  This would be a good place to start using it
yourself.
