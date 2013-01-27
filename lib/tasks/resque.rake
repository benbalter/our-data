require 'resque/tasks'
task "resque:preload" => :environment
task "jobs:work" => "resque:work"

# see http://stackoverflow.com/questions/5880962/how-to-destroy-jobs-enqueued-by-resque-workers - old version
# see https://github.com/defunkt/resque/issues/49
# see http://redis.io/commands - new commands
 
namespace :resque do
  desc "Clear pending tasks"
  task :clear => :environment do
    queues = Resque.queues
    queues.each do |queue_name|
      puts "Clearing #{queue_name}..."
      Resque.redis.del "queue:#{queue_name}"
    end
    
    puts "Clearing delayed..." # in case of scheduler - doesn't break if no scheduler module is installed
    Resque.redis.keys("delayed:*").each do |key|
      Resque.redis.del "#{key}"
    end
    Resque.redis.del "delayed_queue_schedule"
    
    puts "Clearing stats..."
    Resque.redis.set "stat:failed", 0 
    Resque.redis.set "stat:processed", 0
  end
end