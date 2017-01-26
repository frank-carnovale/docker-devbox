# docker-devbox


# OVERVIEW
A dev/runtime environment for Perl/Mojolicious based on Centos7.

Centos, SQLite, trivial sample db from DBIx::Class, Perl, Mojolicious, etc

.. all sufficient for a typical Mojolicious app which should be shared to the folder /App.
If not shared, the trivial 'Blah' app (github:frank-carnovale/Blah), is downloaded and invoked by default.

The app is launched by explicitly naming the built-in GO script as a command.  It will run as a web server listenting to port 3000.

# Usage Notes
```
# Name the dev server..
devi=frankcarnovale/devbox

# fully automatic download-and-run of default app frank-carnovale/Blah
docker run --rm -p 80:3000 $devi GO

# run Mojolicious app located in local folder..
docker run --rm -it -p 80:3000 -v /some/project/App:/App $devi GO

# don't start any service yet, just share a folder and get an internal bash prompt..
docker run --rm -it -p 80:3000 -v /some/project/App:/App $devi

# at internal prompt: run 'tables' facility on a remote db..
tables 'dbi:Pg:dbname=test_db;host=172.17.0.2' test_user x

# run same but specify internal listening port..
MOJO_LISTEN='http://*:80' tables 'dbi:Pg:dbname=test_db;host=172.17.0.2' test_user x

# run same directly from host..
cmd="tables 'dbi:Pg:dbname=test_db;host=172.17.0.2' test_user x"
docker run --rm -ti -p 80:3000 $devi  bash -c "$cmd"
```
