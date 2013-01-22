class Crawler

  @queue = :crawler_queue

  def self.perform(domain_id)
    domain = Domain.find domain_id
    domain.crawl 
  end

end