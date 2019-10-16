#!/bin/bash

set -e

cd /usr/local && mkdir {share,lib64}/perl5

cpan install                 \
    Class::Accessor::Grouped \
    Class::C3::Componentised \
    Class::Method::Modifiers \
    Clone::Choose            \
    Devel::GlobalDestruction \
    Module::Find             \
    Moo                      \
    Package::Stash           \
    Package::Stash::XS       \
    Role::Tiny               \
    SelfLoader               \
    Sub::Name                \
    Test::Deep               \
    Test::Exception          \
    Test::File::ShareDir::Dist \
    Test::Fatal              \
    Test::More               \
    Test::Warn               \
    Text::Balanced           \
    YAML::XS                 \
    namespace::clean         \


cpan install                 \
    DateTime                 \
    DateTime::Format::Pg     \
    DateTime::Format::SQLite \


cpan install                 \
    Config::Any              \
    Context::Preserve        \
    Data::Dumper::Concise    \
    Data::Page               \
    Hash::Merge              \
    Scope::Guard             \
    SQL::Abstract            \

rm -rf /root/.cpan
