web: bundle exec rails server thin -p $PORT -e $RACK_ENV
worker: TERM_CHILD=1 RESQUE_TERM_TIMEOUT=10 QUEUE=* bundle exec rake resque:work