task "update_domain_list" => :environment do
  Domain.update_domain_list
  puts "domain list updated; workers enqueued."
end