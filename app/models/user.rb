class User < ActiveRecord::Base
  attr_accessible :ip
  acts_as_voter
end
