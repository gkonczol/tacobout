class Shop < ApplicationRecord
  attr_accessor :is_truck, :location
  enum primary_ingredient: { truck: 0, restaurant: 1, drive_through: 2 }

  TACOS = {
    beef_taco: 'nice beef taco with beans',
    veggie_taco: 'taco with guac and tempe'
  }

  def initialize(is_truck, location, rating)
    @is_truck = is_truck
    @location = location
    @rating = rating
  end

  def get_tacos
    TACOS
  end

  def get_location
    location
  end

  def rate_up(rating)
    rating.rate_up(rating) 
  end

  def get_rating
    rating.get_rating
  end
end
