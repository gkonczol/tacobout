class ReviewsController < ApplicationController

	def new
		@user = User.find_by id: params[:user_id]
		if @user.nil?
			@user = NullUser.new
			@user.setup
		end
		@shops = Shop.all
		@tacos = Taco.all
		@review = Review.new
	end

	def index
		@reviews = Review.all
	end

	def create
		rating = Rating.create(
			rating: params[:review][:rating],
			taco_id: params[:taco_id],
			shop_id: params[:shop_id],
		)
		rating.save
		review = Review.create(
			rating_id: rating.id,
			user_id: params[:user_id],
			comment: params[:review][:comment]
		)
		review.save
		redirect_to reviews_path
	end
end
