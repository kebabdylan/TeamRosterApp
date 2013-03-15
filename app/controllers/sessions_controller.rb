class SessionsController < ActionController::Base

	def login_user
		@member = Member.find_by_username_and_password(params[:username],params[:password])

		unless @member.nil?
			flash[:message] = "You have been logged in!"
			session[:is_logged_in] = true
			session[:member] = @member
			redirect_to :controller=>"me", :action=>"index"

		else
			flash[:message] = "Login Failed. Please try again..."
			redirect_to :action=>"prompt"
		end

	end

	def logout_user
		session[:is_logged_in] = nil
		session[:member] = nil
		flash[:message] = "Goodbye. You have been logged out."
		redirect_to "/login"
	end

	def prompt

	end

end
