class SessionsController < ActionController::Base

	def login_user

		@member = Member.find_by_username(params[:username])

		if @member.nil?
			flash[:message] = "You have been logged in!"
			session[:is_logged_in] = true
			session[:member] = @member
			redirect_to @member

		else
			flash[:message] = "Login Failed. Please try again..."
			redirect_to "prompt"
		end

	end

	def logout_user
		session[:is_logged_in] = nil
		session[:member] = nil
	end

	def prompt

	end

end
