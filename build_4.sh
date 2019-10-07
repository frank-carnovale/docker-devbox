#!/bin/bash

set -e

cpan install                             \
    DBIx::Class                          \
    DBIx::Class::Schema::Loader          \
    DateTime::Format::Pg                 \
    DateTime::Format::SQLite             \
    XML::SAX::Expat                      \
    Mojolicious                          \
    Mojolicious::Plugin::CORS            \
    Mojolicious::Plugin::OpenAPI         \
    Mojolicious::Plugin::StaticLog       \
    DBIx::Class::Schema::Loader::Dynamic \
    Mojolicious::Plugin::Tables          \
  || true

rm -rf /root/.cpan

echo done
true

# fix problem with 'prove' not honouring -c flag; will now colorise output in Jenkins..
#(
#  cd /patches
#  patch /usr/share/perl5/vendor_perl/TAP/Harness.pm rt-cpan-org-71850
#)

