class Member < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :password, :username, :is_admin
  validates :email, :first_name, :last_name, :password, :username, :presence=>true
  has_many :rosters
  has_many :teams, :through=>:rosters

  def full_name
  	"#{first_name} #{last_name}"
  end

  def projects 	
  	teams.map(&:projects).flatten
  end
end
