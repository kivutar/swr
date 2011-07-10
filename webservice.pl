#!/usr/bin/perl
use Dancer;
use MongoDB;
set logger => 'console';

my $connection = MongoDB::Connection->new(host => 'localhost', port => 27017);
my $database   = $connection->swr;
my $collection = $database->tmp;

get '/' => sub {
    my $cursor = $collection->query(
        from_json( params->{query}   || '{}' ),
        from_json( params->{options} || '{}' )
    );
    my @results;
    while ( my $entry = $cursor->next ) {
        delete $$entry{_id};
        delete $$entry{date};
        push @results, $entry;
    }
    to_json \@results;
};

dance;
