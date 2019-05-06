# frozen_string_literal: true

class Taco < ApplicationRecord
  belongs_to :shell
  belongs_to :shop

  def vegan?
    ingredients.each do |ingred|
      if not ingred.vegan?
        return false
      end
    end
    true
  end
end
