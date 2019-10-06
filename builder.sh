#!/bin/bash

echo 'LANG=C' >/etc/locale.conf

yum -y install                                                                              \
    autoconf automake binutils bison flex gcc gcc-c++ gettext libtool make patch pkgconfig  \
    git net-tools libaio expat-devel

yum -y install                  \
    perl-Carp-Clan              \
    perl-Class-Inspector        \
    perl-CPAN                   \
    perl-DBD-Pg                 \
    perl-DBD-SQLite             \
    perl-Env                    \
    perl-JSON                   \
    perl-Module-Build           \
    perl-Module-Runtime         \
    perl-LWP-Protocol-https     \
    perl-XML-SAX                \
    perl-XML-Simple             \
    perl-YAML                   \
    perl-libwww-perl

yum -y install epel-release

yum -y install                   \
    perl-ExtUtils-Config         \
    perl-ExtUtils-Helpers        \
    perl-ExtUtils-InstallPaths   \
    perl-Module-Build-Tiny       \
    perl-Path-Class              \
    perl-Text-Unidecode          \


cd /usr/local && mkdir {share,lib64}/perl5

# temporary during probs with DBIx::Class::Schema::Loader..
#(
#    cd /patches
#    tar xzf Hash-Merge-0.200.tar.gz
#    cd      Hash-Merge-0.200 && cpan .
#)

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

# fix problem with 'prove' not honouring -c flag; will now colorise output in Jenkins..
(
  cd /patches
  patch /usr/share/perl5/vendor_perl/TAP/Harness.pm rt-cpan-org-71850
)

mkdir /App

chmod +x /usr/local/bin/GO

# these were good on Amazon Linux but not Centos7..
# RUN yum install perl-Test-Exception perl-Test-Most perl-Test-Simple perl-Test-Warn perl-Carp-Clan perl-Class-Inspector perl-Config-Any perl-Context-Preserve perl-CPAN perl-Data-Dump perl-Data-Dumper-Concise perl-DBD-Pg perl-DBD-SQLite perl-Env perl-Module-Build perl-MRO-Compat perl-namespace-clean perl-Path-Class perl-Scope-Guard perl-Term-ReadLine-Gnu
