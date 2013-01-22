require 'resque/tasks'
require 'resque_scheduler/tasks'
task "resque:preload" => :environment
task "resque:setup" => :environment do
  require 'resque'
  require 'resque_scheduler'
  require 'resque/scheduler'

  Resque.schedule = YAML.load_file('config/schedule.yml')
  ENV['QUEUE'] = '*'
end
task "resque:setup_scheduler" => :environment
task "jobs:work" => "resque:work"