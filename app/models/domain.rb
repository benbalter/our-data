class Domain < ActiveRecord::Base
  attr_accessible :hostname, :agency_id, :last_crawled
  belongs_to :agency
  
  before_validation :clean_hostname
  validates_presence_of :hostname, :agency_id
  
  require 'open-uri'
  require 'json'
  
  def clean_hostname
    self.hostname = PostRank::URI.clean self.hostname
    self.hostname = Addressable::URI.parse(self.hostname).host
  end
  
  def self.update_domain_list

    domain_list = 'https://explore.data.gov/api/views/deuw-vn8r/rows.json?accessType=DOWNLOAD'
    
    json =  JSON.parse open(domain_list).read

    ids = []
    
    for row in json["data"] do
      hostname = PostRank::URI.clean row[8][0]
      hostname = Addressable::URI.parse(hostname).host
      
      agency = Agency.find_or_create_by_name row[9]
      domain = Domain.find_or_initialize_by_hostname hostname
      
      if domain.new_record? #check if domain already exists
        domain.agency = agency
        domain.save
      end
      
      ids.push domain.id
      
      Resque.enqueue Crawler, domain.id #schedule domain to be crawled

    end

    Domain.where( "id NOT IN (?)", ids ).destroy_all #remove any domains that no longer exist in the JSON
    
  end
  
  def crawl
    begin
      json = open( self.hostname + '/data.json' ).read
      datasets = JSON.parse json
      datasets.each do |dataset|
        dataset["organization"] = self.agency.name #force JSON to use our agency name since we're crawling their /data file
        d = Dataset.find_or_create_by_url dataset["url"]
        d.parse_json dataset
        d.save
      end
    rescue

    end
    self.update_attributes :last_crawled => Time.now
  end
  
  def as_json(options={})
    { :hostname => hostname, :agency_id => agency_id, :last_crawled => last_crawled }
  end
  
end
