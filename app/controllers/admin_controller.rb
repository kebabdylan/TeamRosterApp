class AdminController < ApplicationController
 before_filter :restrict_to_admin


  def restrict_to_admin
  	if !session.has_key? :is_admin or !session[:is_admin]
  		flash[:message] = "You must be an administrator."
  		#redirect_to "/login"
  	end
  end

end