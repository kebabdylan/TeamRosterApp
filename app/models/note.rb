class Note < ActiveRecord::Base
  belongs_to :project
  attr_accessible :content, :is_private, :project_id
  validates :content, :presence=>true
end
