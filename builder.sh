#!/bin/bash

yum -y install                                                                              \
	autoconf automake binutils bison flex gcc gcc-c++ gettext libtool make patch pkgconfig  \
	redhat-rpm-config rpm-build rpm-sign git net-tools                                      \
	perl-Test-Exception perl-Test-Simple perl-Test-Warn perl-Carp-Clan perl-Class-Inspector \
	perl-CPAN perl-DBD-Pg perl-DBD-SQLite perl-Env perl-Module-Build perl-TermReadKey       \
	perl-Error perl-Git perl-YAML perl-DateTime perl-Module-Install

cd /usr/local && mkdir {share,lib64}/perl5

cpan install                                                                     \
	DBIx::Class DBIx::Class::Schema::Loader DBIx::Class::Schema::Loader::Dynamic \
	Mojolicious Mojolicious::Plugin::Tables Term::ReadLine::Perl                 \
    DateTime::Format::SQLite DateTime::Format::Pg

cat <<DEVBOX >/etc/profile.d/devbox.sh
set -o vi
shopt -s direxpand
alias h=history
export LESS="-M -I -R -X"
HISTSIZE=99999
DEVBOX

mkdir /Blah

cat <<GO >/usr/local/bin/GO
#!/bin/bash
# install a default 'Blah' app if there is not one there already..
cd /
[ $(ls Blah | wc -l) = 0 ] && git clone https://github.com/frank-carnovale/Blah.git
cd Blah
morbo script/blah    # listens at env var MOJO_LISTEN; defaults to http://*:3000
GO
chmod +x /usr/local/bin/GO

# these were good on Amazon Linux but not Centos7..
# RUN yum install perl-Test-Exception perl-Test-Most perl-Test-Simple perl-Test-Warn perl-Carp-Clan perl-Class-Inspector perl-Config-Any perl-Context-Preserve perl-CPAN perl-Data-Dump perl-Data-Dumper-Concise perl-DBD-Pg perl-DBD-SQLite perl-Env perl-Module-Build perl-MRO-Compat perl-namespace-clean perl-Path-Class perl-Scope-Guard perl-Term-ReadLine-Gnu

