class Member < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :password, :username, :is_admin, :profile
  validates :first_name, :last_name, :password, :username, :presence=>true
  
  has_many :notes

  has_many :rosters
  has_many :teams, :through=>:rosters

  def full_name
  	"#{first_name} #{last_name}"
  end

  def projects 	
  	teams.map(&:projects).flatten
  end

  def has_team
    if teams.length > 0
      true
    else
      false
    end
  end
end
