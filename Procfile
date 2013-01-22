web: bundle exec rails server thin -p $PORT -e $RACK_ENV
worker: QUEUE=* bundle exec rake resque:work
2scheduler: bundle exec rake resque:scheduler