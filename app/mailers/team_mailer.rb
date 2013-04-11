class TeamMailer < ActionMailer::Base
  default from: "jarpnd@gmail.com"

  def broadcast(team, message)
  	@team = team
  	@message = message

  	@team.members.each do | member | 
	  	 mail(:to => 'jarpnd@gmail.com', :subject => "Broadcast from RosterfarianApp")
	  	end
  end

end
