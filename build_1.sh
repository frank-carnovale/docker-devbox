#!/bin/bash

set -e

echo 'LANG=C' >/etc/locale.conf

yum -y install                                                          \
    autoconf automake bison flex gcc gcc-c++ gettext libtool make patch \
    git net-tools libaio expat-devel

yum -y install                  \
    perl                        \
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
    perl-Test                   \
    perl-XML-SAX                \
    perl-XML-Simple             \
    perl-YAML                   \
    perl-libwww-perl

yum clean all

