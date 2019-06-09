class ShopsController < ApplicationController
	def new
		@shop = Shop.new
	end

	def index
		@shops = Shop.all
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
