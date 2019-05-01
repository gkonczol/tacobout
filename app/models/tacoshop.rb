class TacoShop

  attr_accessor :is_truck, :location
  #Tacoshop type as enum? think abboudit

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

  def rate(rating)
    rating.add_rating(rating) 
  end

  def get_rating
    rating.rating
  end

end