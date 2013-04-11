class Note < ActiveRecord::Base
  belongs_to :project
  belongs_to :member
  attr_accessible :content, :is_private, :project_id, :member_id
  validates :content, :presence=>true
end
