class Rating < ApplicationRecord
  belongs_to :taco
  belongs_to :shop

  attr_accessor :rating

  def setup(params)
    self.rating = params.fetch(:rating, 0)
    self.taco_id = params.fetch(:taco, nil)
    self.shop_id = params.fetch(:shop, nil)
  end
end
