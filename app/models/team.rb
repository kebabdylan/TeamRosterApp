class Team < ActiveRecord::Base
  attr_accessible :logo, :mascot, :name
  has_many :members,  :through => :roster

  validates :name, :presence => true
end
