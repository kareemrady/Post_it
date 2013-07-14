class SessionsController < ApplicationController

	def new; end

	
	def create
		user = User.find_by(username: params[:username])

		if user && user.authenticate(params[:password])
			session[:user_id] = user.id
			redirect_to root_path, notice: "You have successfully Logged in"

		else
			flash[:error] = "Username or Password doesn't exist"
			redirect_to login_path

		end

	end

	def destroy 
		session[:user_id] = nil
		redirect_to login_path, notice: "You have successfully logged out"

	end


end
