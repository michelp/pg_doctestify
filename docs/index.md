# pg_doctestify

Turn PostgreSQL Doctests into Markdown

> NOTE: This is a different tool than the extension
> [pg_doctest](https://gitlab.com/dalibo/pg_doctest). `pg_doctestify`
> is not an extension but a script that turns Postgres regression test
> results into formatted markdown for publishing with a site generator
> tool like [mkdocs](https://github.com/mkdocs/mkdocs).  `pg_doctest`
> actually stores tests in the database as comments inside functions,
> so these two tools are pretty much orthogonal to each other and can
> probably be used together in interesting ways!

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

So, if you format your sql file comments as
[markdown](https://www.markdownguide.org/), you get a very similar
result as Python doctests.  You write tests, you write comments with
markdown in them, and a then run pg_regress as usual (typically with
`make installcheck`) and then use this tool to transform the output
file into a markdown file.

This tool will strip sql comment prefixes and add formatting,
including code blocks, around the input and output sql.  This
generated markdown can then be used with many common static site
generation tools, like mkdocs.  This documentation you are reading has
been generated with this tool.

For some examples of previous iterations of this tool in real-world
use, check out the following projects:

  - [OneSparse](https://onesparse.com/docs.html) Postgres extension
    for the
    [SuiteSparse](https://people.engr.tamu.edu/davis/GraphBLAS.html)
    GraphBLAS Sparse Graph library

  - [pg_crdt](https://supabase.github.io/pg_crdt/automerge/) Postgres
    extension for the [automerge](https://automerge.org/) CDRT library

## Usage

This tool is not itself a Postgres extension, but rather a Python
script tool included in this distribution.  It does contains a small
pointless sample extension with a Makefile for building it and the
documentation which uses the script.

Clone the tool from [Github](https://github.com/michelp/pg_doctestify)
and pick and choose what parts you want.  There's the main script, a
Makefile target for building docs, and a Dockerfile to try it out
quickly.

There is no installation, you copy the script into your project and
update your own Makefile to fit it into an existing extension.  Tested
on Python 3.10 but should work with any reasonably modern Python 3.

There is a Dockerfile that sets up and runs the tests and runs mkdocs
to build the site locally.  This would be a good place to start using
it yourself.  To see it fully rendered, make sure mkdocs is installed
and first run `./test.sh` to run the docker build and then `mkdocs serve` 
to serve it on localhost.
