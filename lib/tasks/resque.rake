require 'resque/tasks'
require 'resque_scheduler/tasks'
task "resque:preload" => :environment
task "resque:setup" do
  require 'resque'
  require 'resque_scheduler'
  require 'resque/scheduler'

  Resque.schedule = YAML.load_file('config/schedule.yml')

end
