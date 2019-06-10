class ShopsController < ApplicationController
	def new
		@shop = Shop.new
	end

	def index
		@shops = Shop.all
	end

	def show
		@shop = Shop.find(params[:id])
		@tacos = Taco.where(shop_id: @shop.id)
		@ratings = Rating.where(shop_id: @shop.id)
		@reviews = []
		@ratings.each do |r|
			@reviews.push(Review.find_by rating_id: r.id)
		end

	end

	def create
		shop = Shop.create(
			name: params[:shop][:name],
			address: params[:shop][:address]
		)
		shop.save
		redirect_to shops_path
	end
end
