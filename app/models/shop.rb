class Shop < ApplicationRecord
  has_many :taco
  enum type: {
    truck: 0,
    restaurant: 1,
    drive_through: 2
  }
end
