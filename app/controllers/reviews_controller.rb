class ReviewsController < ApplicationController

	def new
		@user = User.find_by(params.fetch(:user_id, "0")) # user_id
		if @user.nil?
			@user = NullUser.new
			@user.setup
		end
		@review = Review.new
	end
end
