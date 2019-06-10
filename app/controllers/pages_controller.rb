class PagesController < ApplicationController
  def home
  	@user = User.new
  end

  def login
  	@user = User.find_by username: params[:user][:username], password: params[:user][:password]
  	if @user.nil?
  		redirect_to new_user_path(:not_found => true)
  	else
  		redirect_to user_path(@user)
  	end
  end
end