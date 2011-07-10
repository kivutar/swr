# Social Web Ranking

Work in progress.

## Dependancies

 * perl-uri
 * perl-dancer
 * mongodb
 * perl-mongodb
 * perl-datetime

## Usage

### A plugin returns the score of an url for a service

    ./plugins/backtweets.pl http://www.openedition.org
    8

### The crawler calls each plugin for each url

    cat urls | ./crawler.pl

### The web service is a wrapper around mongo query

Launch the service

    ./webservice.pl 
    >> Dancer 1.3060 server 14147 listening on http://0.0.0.0:3000
    == Entering the development dance floor ...

Visit http://localhost:3000/?query={%22source%22:%22backtweets.pl%22}&options={%22sort_by%22:{%22score%22:-1}}

Result:

    [ { "source" : "backtweets.pl", "url" : "http://www.openedition.org\n", "score" : "8" }, { "source" : "backtweets.pl", "url" : "http://calenda.revues.org\n", "score" : "169" }, { "source" : "backtweets.pl", "url" : "http://www.revues.org\n", "score" : "15" }, { "source" : "backtweets.pl", "url" : "http://cleo.cnrs.fr\n", "score" : 0 }, { "source" : "backtweets.pl", "url" : "http://hypotheses.org\n", "score" : 0 } ]

