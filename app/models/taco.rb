# frozen_string_literal: true

class Taco < ApplicationRecord
  belongs_to :shell
  belongs_to :shop
  has_many :ratings
  has_and_belongs_to_many :ingredients

  def vegan?
    ingredients.each do |ingred|
      if not ingred.vegan?
        return false
      end
    end
    true
  end
  
  def average_spice
    total_spice = ingredients.reduce(:+)
    total_spice / ingredients.count
  end
end
