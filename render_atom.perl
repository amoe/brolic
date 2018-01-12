#!/usr/bin/env perl
use v5.20.2;
use Data::Dump qw/dump/;
use Getopt::Long;
use Text::Template;
use autodie qw(:all);
use strict;
use warnings;

use CGI;

my $cgi = CGI->new;
print $cgi->header('application/atom+xml');


my $tmpl = 
'<?xml version="1.0" encoding="utf-8"?>
<feed xmlns="http://www.w3.org/2005/Atom">
  <id>tag:solasistim.net,2018-01-10:/daily_politics.atom</id>
  <title>Daily Politics</title>
  <updated>2018-01-10T12:00:00Z</updated>
  <author>
    <name>David Banks</name>
  </author>
  <link href="http://solasistim.net/" />
  <link rel="self" href="http://solasistim.net/daily_politics.atom" />

  <entry>
    <id>tag:solasistim.net,2018-01-10:/dailypolitics/1</id>
    <title>Daily Politics, 09_01_2018</title>
    <updated>2018-01-10T12:00:00Z</updated>
    <link href="http://solasistim.net/dailypolitics/1" />
    <summary>This is a summary of the daily politics episode.</summary>
    <link rel="enclosure"
          type="audio/mp4"
          title="MP4"
          href="http://www.solasistim.net/Daily%20Politics,%2009_01_2018-b09m90mk.mp3"
          length="25217952" />
    <content type="xhtml">
      <div xmlns="http://www.w3.org/1999/xhtml">
        <h1>Show Notes</h1>
        <p>Some text goes here.</p>
      </div>
    </content>
  </entry>
</feed>
';


my $template = Text::Template->new(
    TYPE => 'STRING',
    SOURCE => $tmpl
)
    or die "Couldn't construct template: $Text::Template::ERROR";

my @eps = ("Daily Politics,009_01_2018-b09m90mk.mp3");

my %vars = (files => \@eps);

my $result = $template->fill_in(HASH => \%vars);

print $result;

