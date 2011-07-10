#!/usr/bin/perl
use MongoDB;
use DateTime;

my $connection = MongoDB::Connection->new(host => 'localhost', port => 27017);
my $database   = $connection->swr;
my $collection = $database->tmp;

opendir(PLUGINS, "plugins");
my @plugins = grep /pl$/, readdir(PLUGINS);
closedir(PLUGINS);

while ( my $url = <>) {
    for my $plugin ( @plugins ) {
        $collection->insert({ url    => $url
                            , source => $plugin
                            , score  => `plugins/$plugin $url` || 0
                            , date   => DateTime->from_epoch( epoch => time() )
                            });
    }
}
