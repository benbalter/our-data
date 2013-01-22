class Agency < ActiveRecord::Base
  attr_accessible :name
  has_many :domains
  has_many :datasets

  def as_json(options={})
    { :name => name, :datasets => self.datasets, :domains => self.domains }
  end
end