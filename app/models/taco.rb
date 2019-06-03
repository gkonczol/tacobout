# frozen_string_literal: true

class Taco < ApplicationRecord
  # belongs_to :shell
  # belongs_to :shop
  # has_many :ratings
  # has_and_belongs_to_many :ingredients

  attr_accessor :my_ratings

  def setup
    @my_ratings = []
  end

  def vegan?
    ingredients.all?(&:vegan)
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
    new_rating.setup(rating: rating, taco: self.id)
    new_rating.save
    my_ratings.push(new_rating)
  end

  # def perform(big_dependency)
  #   big_dependency.execute
  #   return 42
  # end
  
end
