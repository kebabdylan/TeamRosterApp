class Project < ActiveRecord::Base
  belongs_to :team
  attr_accessible :description, :svn, :title, :website
  validates :title, :presence=>true
end
