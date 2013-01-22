Resque.redis = ENV["REDISTOGO_URL"]
Resque.after_fork = Proc.new { ActiveRecord::Base.establish_connection }