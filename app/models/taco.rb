# frozen_string_literal: true

class Taco < ApplicationRecord
  attr_accessor :name, :description, :shell, :shop, :ingredients

  def initialize(params = {})
    @name = params[:name]
    @description = params[:description]
    @shell = params[:shell]
    @shop = params[:shop]
    @ingredients = params.fetch(:ingredients, [])
  end
end
