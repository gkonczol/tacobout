class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
		@reviews = Review.where(user_id: @user.id)
	end

	def write
		@user = User.find(params[:id])
		redirect_to new_review_path(user_id: @user.id)
	end

	def create
		newuser = User.create(
			username: params[:user][:username],
			password: params[:user][:password],
			email: params[:user][:email]
		)
		if newuser.save
			redirect_to user_path(newuser)
		else
			render :new
		end
	end
end
