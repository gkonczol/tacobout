class Taco < ApplicationRecord

  attr_accessor :shell, :shop, :ingredients

  def initialize(params = {})
    @shell = params[:shell]
    @shop = params[:shop]
    @ingredients = params.fetch(:ingredients, [])
  end

end
