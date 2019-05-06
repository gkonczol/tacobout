# frozen_string_literal: true

class Taco < ApplicationRecord
  belongs_to :shell
  belongs_to :shop

  def average_spice
    total_spice = ingredients.reduce(:+)
    total_spice / ingredients.count
  end
end
