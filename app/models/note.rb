class Note < ActiveRecord::Base
  belongs_to :project
  attr_accessible :content, :is_private
  validates :content, :presence=>true
end
