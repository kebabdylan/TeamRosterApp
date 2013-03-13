class Project < ActiveRecord::Base
  belongs_to :team
  has_many :notes
  attr_accessible :description, :svn, :title, :website, :team_id, :notes
  validates :title, :presence=>true
end
