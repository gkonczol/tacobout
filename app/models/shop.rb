class Shop < ApplicationRecord
  has_many :taco
  enum type_id: {
    truck: 0,
    restaurant: 1,
    drive_through: 2
  }

  attr_accessor :tacos

  def add_taco(added_taco)
    @tacos.push(added_taco)
  end
end
