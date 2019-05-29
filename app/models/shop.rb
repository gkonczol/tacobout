class Shop < ApplicationRecord
  has_many :taco
  has_many :ratings
  enum type_id: {
    truck: 0,
    restaurant: 1,
    drive_through: 2
  }

  attr_accessor :tacos, :my_ratings

  def setup(params = [])
    @tacos = params
    @my_ratings = []
  end

  def add_taco(added_taco)
    @tacos.push(added_taco)
  end

  def rating
    rating_sum = 0
    my_ratings.each do |r|
      rating_sum += r.rating
    end
    if my_ratings.length == 0
      return 0
    else
      return (rating_sum / my_ratings.length)
    end
  end


  def rate(rating)
    new_rating = Rating.create
    new_rating.setup(rating: rating, shop: self.id)
    new_rating.save
    my_ratings.push(new_rating)
  end
end
