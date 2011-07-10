#!/usr/bin/perl
use HTTP::Tiny;
use URI::Escape;

my $http = HTTP::Tiny->new;
my $url = uri_escape( $ARGV[0] );
my $r = $http->get("http://backtweets.com/search?q=$url");

print $$r{content} =~ /<li>(\d+) Results<\/li>/
    ? $1
    : $$r{content} =~ s/"timeline"//g;
