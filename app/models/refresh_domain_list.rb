class RefreshDomainList

  @queue = :domain_queue

  def self.perform
    Domain.update_domain_list
  end

end
