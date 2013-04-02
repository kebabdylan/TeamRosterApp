class ApplicationController < ActionController::Base
  protect_from_forgery
  layout "nd"
  
  


 def is_admin
	if !session.has_key? :is_admin or !session[:is_admin]
  		false
  	else
  		true
  	end
 end

 def restrict_to_admin
  	if !session.has_key? :is_admin or !session[:is_admin]
  		flash[:message] = "You must be an administrator."
  		#redirect_to "/login"
  	end
  end

end
