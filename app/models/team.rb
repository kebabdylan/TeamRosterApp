class Team < ActiveRecord::Base
  attr_accessible :logo, :mascot, :name
  has_many :rosters
  has_many :members,  :through => :rosters

  validates :name, :presence => true
end
