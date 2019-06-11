require 'rails_helper'

RSpec.describe Review, type: :model do
	it "can retrieve the name of the shop the review is for" do
		shop = FactoryBot.build(:shop, :manytacos)
		shop.save
		expect(shop.id).to_not be_nil
		
		taco = FactoryBot.build(:taco, :useless)
		taco.save
		expect(taco.id).to_not be_nil
		
		rating = FactoryBot.build(:rating)
		rating.setup(rating: 3, shop: shop.id, taco: taco.id)
		rating.save
		
		expect(rating).to be_a(Rating)
		expect(rating.id).to_not be_nil
		expect(rating.shop_id).to_not be_nil
		
		review = FactoryBot.build(:review)
		review.rating_id = rating.id
		expect(review.get_rating).to eq(rating)
		expect(review.retrieve_shop_name).to eq("Shop of Many Tacos")
		expect(review.retrieve_taco_name).to eq("Useless Taco")
	end

	it "can retrieve the value of a rating associated with a review" do
		shop = FactoryBot.build(:shop, :manytacos)
		shop.save
		expect(shop.id).to_not be_nil
		rating = FactoryBot.build(:rating)
		rating.setup(rating: 4, shop: shop.id)
		rating.save
		review = FactoryBot.build(:review)
		review.rating_id = rating.id
		expect(review.retrieve_rating_value).to eq(4)
	end
end
