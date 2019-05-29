# frozen_string_literal: true

class Taco < ApplicationRecord
  belongs_to :shell
  belongs_to :shop
  has_many :ratings
  has_and_belongs_to_many :ingredients

  def vegan?
    ingredients.all?(&:vegan)
  end

  # def rating
  #   if ratings.empty?
  #     nil
  #   else
  #     rating_sum = 0
  #     ratings.each { |rating| rating_sum += rating.rating_value }
  #     return rating_sum
  #   end
  # end

  # def rate(rating)
  #   ratings.push(Rating.new(rating))
  # end

  # def perform(big_dependency)
  #   big_dependency.execute
  #   return 42
  # end
  
end
