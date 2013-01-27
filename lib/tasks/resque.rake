require 'resque/tasks'
task "resque:preload" => :environment
task "jobs:work" => "resque:work"