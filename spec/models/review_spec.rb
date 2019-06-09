require 'rails_helper'

RSpec.describe Review, type: :model do
	it "can retrieve the name of the shop the review is for" do
		shop = Shop.create(
			name:"Dick's Tacos")
		expect(shop.id).to_not be_nil
		taco = Taco.create(
			name: "the final taco")
		rating = Rating.create(
			shop_id: shop.id,
			taco_id: taco.id)
		expect(rating).to be_a(Rating)
		expect(rating.id).to_not be_nil
		expect(rating.shop_id).to_not be_nil
		review = Review.create(
			rating_id: rating.id)
		expect(review.get_rating).to eq(rating)
		expect(review.retrieve_shop_name).to eq("Dick's Tacos")
		expect(review.retrieve_taco_name).to eq("the final taco")
	end
end
