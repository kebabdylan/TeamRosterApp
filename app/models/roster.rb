class Roster < ActiveRecord::Base
	attr_accessible :team_id, :member_id, :role_id
  belongs_to :team
  belongs_to :member
  belongs_to :role
  # attr_accessible :title, :body
end
