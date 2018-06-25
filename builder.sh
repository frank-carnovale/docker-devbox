#!/bin/bash

yum -y install                                                                              \
    autoconf automake binutils bison flex gcc gcc-c++ gettext libtool make patch pkgconfig  \
    redhat-rpm-config rpm-build rpm-sign git net-tools libaio expat-devel

yum -y install                  \
    perl-Carp-Clan              \
    perl-Class-Data-Inheritable \
    perl-Class-Inspector        \
    perl-Clone                  \
    perl-CPAN                   \
    perl-DateTime               \
    perl-DBD-Pg                 \
    perl-DBD-SQLite             \
    perl-Devel-StackTrace       \
    perl-Env                    \
    perl-Exception-Class        \
    perl-Error                  \
    perl-Git                    \
    perl-IO-Socket-IP           \
    perl-Module-Build           \
    perl-Module-Install         \
    perl-Module-Runtime         \
    perl-Scalar-List-Utils      \
    perl-TermReadKey            \
    perl-Test-Differences       \
    perl-Test-Exception         \
    perl-Test-Fatal             \
    perl-Test-Requires          \
    perl-Test-Simple            \
    perl-Test-Tester            \
    perl-Test-Warn              \
    perl-XML-SAX                \
    perl-XML-Simple             \
    perl-YAML                   \


yum -y install epel-release

yum -y install                   \
    perl-Algorithm-C3            \
    perl-Capture-Tiny            \
    perl-CLASS                   \
    perl-Class-Accessor          \
    perl-Class-Accessor-Chained  \
    perl-Class-Method-Modifiers  \
    perl-Class-XSAccessor        \
    perl-Config-Any              \
    perl-Context-Preserve        \
    perl-Data-Dumper-Concise     \
    perl-DateTime-Format-MySQL   \
    perl-DateTime-Format-Oracle  \
    perl-DateTime-Format-Pg      \
    perl-Devel-GlobalDestruction \
    perl-ExtUtils-Config         \
    perl-ExtUtils-Helpers        \
    perl-ExtUtils-InstallPaths   \
    perl-Lingua-Stem-Snowball    \
    perl-Module-Build-Tiny       \
    perl-Module-Find             \
    perl-MRO-Compat              \
    perl-namespace-clean         \
    perl-Path-Class              \
    perl-Role-Tiny               \
    perl-Scope-Guard             \
    perl-Sub-Name                \
    perl-TAP-Harness-Env         \
    perl-Term-ReadLine-Gnu       \
    perl-Test-Deep               \
    perl-Test-Most               \
    perl-Text-Unidecode          \


cd /usr/local && mkdir {share,lib64}/perl5

# temporary during probs with DBIx::Class::Schema::Loader..
(
    cd /patches
    tar xzf Hash-Merge-0.200.tar.gz
    cd      Hash-Merge-0.200 && cpan .
)

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
