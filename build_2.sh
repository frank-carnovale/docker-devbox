#!/bin/bash

set -e

yum -y install epel-release

yum -y install                   \
    perl-ExtUtils-Config         \
    perl-ExtUtils-Helpers        \
    perl-ExtUtils-InstallPaths   \
    perl-Module-Build-Tiny       \
    perl-Path-Class              \
    perl-Text-Unidecode          \


yum clean all
