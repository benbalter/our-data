class Dataset < ActiveRecord::Base
  attr_accessible :contact_email, :contact_name, :description, :documentation_url, :last_updated, :public, :title, :url
  belongs_to :agency
  acts_as_taggable_on :tags, :formats
  has_many :DatasetAttributes

  validates_presence_of :agency_id, :title, :url
  validates_uniqueness_of :url
  validates_uniqueness_of :title, :scope => :agency_id

  $map = {  "title"          => "title", 
            "description"    => "description", 
            "dataDictionary" => "documentation_url", 
            "accessURL"      => "url", 
            "modified"       => "last_updated", 
            "person"         => "contact_name", 
            "mbox"           => "contact_email", 
            "public"         => "public" 
          }                 
  
  def as_json(options={})
    json = {}
    $map.each do |key,value|
      json[key] = self[value]
    end
    json["organization"] = self.agency.name
    json["keywords"] = self.tag_list.to_s
    json["format"] = self.format_list.to_s
    json
  end
    
  def parse_json(data)
    data = JSON.parse data if data.is_a? String
    data.each do |key, value|
      self[ $map[ key ] ] = value if $map.has_key? key
    end
    self.agency_id = Agency.find_or_create_by_name(data["organization"]).id
    self.tag_list = data["keywords"]
    self.format_list = data["format"]
  end
  
  def test_json
    { title: "test", description: "test description", dataDictionary: "http://foo.gov/data", accessURL: "http://foo.gov/dataset", format: "json", keywords: "foo, bar, test", modified: "", organization: "Federal Communications Commission", person: "Uncle Sam", mbox: "sam@fcc.gov", public: true }.to_json
    
  end
  
end