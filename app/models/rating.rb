class Rating < ApplicationRecord
  belongs_to :taco
  belongs_to :shop

  attr_accessor :rating_value


  def initialize(rating_value = nil)
    @rating_value = rating_value
    @cumulative_rating = 0
    @num_ratings = 0
  end

  def add_rating(new_rating)
    num_ratings += 1
    cumulative_rating += new_rating
    rating_value = (cumulative_rating) / num_ratings
  end
end
