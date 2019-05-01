class Rating < ApplicationRecord
  has_a :rating
  belongs_to :taco
  belongs_to :shop
end
