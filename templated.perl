#!/usr/bin/env perl
use v5.20.2;
use DateTime;
use Data::Dump qw/dump/;
use Getopt::Long;
use File::Util;
use File::Spec;
use Template;
use autodie qw(:all);
use strict;
use warnings;
use URI::Escape qw(uri_escape);
use CGI;

my $cgi = CGI->new;
print $cgi->header('application/atom+xml');

# this is an RFC3339 formatter from a module that can probably easily be 
# hugely simplified
sub format_datetime {
    my ($dt) = @_;

    my $tz;
    if ($dt->time_zone()->is_utc()) {
        $tz = 'Z';
    } else {
        my $secs  = $dt->offset();
        my $sign = $secs < 0 ? '-' : '+';  $secs = abs($secs);
        my $mins  = int($secs / 60);       $secs %= 60;
        my $hours = int($mins / 60);       $mins %= 60;
        if ($secs) {
            ( $dt = $dt->clone() )
                ->set_time_zone('UTC');
            $tz = 'Z';
        } else {
            $tz = sprintf('%s%02d:%02d', $sign, $hours, $mins);
        }
    }

    return
        $dt->strftime(
            ($dt->nanosecond()
             ? '%Y-%m-%dT%H:%M:%S.%9N'
             : '%Y-%m-%dT%H:%M:%S'
            )
    ).$tz;
}


my $path = "/home/amoe/episodes";

my $f = File::Util->new();

my @files = $f->list_dir($path, '--no-fsdots');

my @objects;

for my $file (@files) {
    my $abs = File::Spec->rel2abs($file, $path);
    my $length = $f->size($abs);

    my $mtime = $f->last_modified($abs);

    my $dt = DateTime->from_epoch(epoch => $mtime);

    my $rfc_date = format_datetime($dt);

    my %record = (
        file => $file,
        length => $length,
        updated => $rfc_date,
        escaped => uri_escape($file)
    );

    push @objects, \%record;
}

my $tt = Template->new({
    INCLUDE_PATH => '.',
});

my $vars = {
    name     => 'Count Edward van Halen',
    debt     => '3 riffs and a solo',
    deadline => 'the next chorus',
    episodes   => \@objects,
};

$tt->process('daily_politics.atom.tmpl', $vars) || die $tt->error(), "\n";
