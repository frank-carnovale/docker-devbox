#!/bin/bash

yum -y install                                                                              \
    autoconf automake binutils bison flex gcc gcc-c++ gettext libtool make patch pkgconfig  \
    redhat-rpm-config rpm-build rpm-sign git net-tools libaio                               \
    perl-Test-Exception perl-Test-Simple perl-Test-Warn perl-Carp-Clan perl-Class-Inspector \
    perl-CPAN perl-DBD-Pg perl-DBD-SQLite perl-Env perl-Module-Build perl-TermReadKey       \
    perl-Error perl-Git perl-YAML perl-DateTime perl-Module-Install

cd /usr/local && mkdir {share,lib64}/perl5

cpan install Term::ReadLine::Perl                                                \
    DBIx::Class DBIx::Class::Schema::Loader DBIx::Class::Schema::Loader::Dynamic \
    DateTime::Format::SQLite DateTime::Format::Pg Mojolicious                    \
    Mojolicious::Plugin::Tables       \
    Mojolicious::Plugin::OpenAPI      \
    Mojolicious::Plugin::CORS

mkdir /App

chmod +x /usr/local/bin/GO

# these were good on Amazon Linux but not Centos7..
# RUN yum install perl-Test-Exception perl-Test-Most perl-Test-Simple perl-Test-Warn perl-Carp-Clan perl-Class-Inspector perl-Config-Any perl-Context-Preserve perl-CPAN perl-Data-Dump perl-Data-Dumper-Concise perl-DBD-Pg perl-DBD-SQLite perl-Env perl-Module-Build perl-MRO-Compat perl-namespace-clean perl-Path-Class perl-Scope-Guard perl-Term-ReadLine-Gnu

