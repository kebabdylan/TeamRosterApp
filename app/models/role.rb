class Role < ActiveRecord::Base
  attr_accessible :level, :name
  belongs_to :roster
  validates :level, :name, :presence=>true
end
