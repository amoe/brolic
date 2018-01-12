#!/usr/bin/env perl
use v5.20.2;
use Data::Dump qw/dump/;
use Getopt::Long;
use Template;
use autodie qw(:all);
use strict;
use warnings;


my $tt = Template->new({
    INCLUDE_PATH => '.',
});

my $vars = {
    name     => 'Count Edward van Halen',
    debt     => '3 riffs and a solo',
    deadline => 'the next chorus',
    menu   => [ 'modules', 'authors', 'scripts' ],
};

$tt->process('overdrawn.tmpl', $vars) || die $tt->error(), "\n";
