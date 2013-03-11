class Member < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :password, :username
  validates :email, :first_name, :last_name, :password, :username, :presence=>true
  has_many :rosters
  has_many :teams, :through=>:rosters


  def full_name
  	"#{first_name} #{last_name}"
  end

end
