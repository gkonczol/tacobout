class Review < ApplicationRecord
  belongs_to :user
  belongs_to :rating

  def get_rating
  	return Rating.find_by id: self.rating_id
  end

  def retrieve_shop_name
  	@shop = Shop.find_by id: get_rating.shop_id
  	return @shop.name
  end

  def retrieve_taco_name
  	@taco = Taco.find_by id: get_rating.taco_id
  	return @taco.name
  end

  
end
