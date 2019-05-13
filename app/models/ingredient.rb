class Ingredient < ApplicationRecord
  has_and_belongs_to_many :tacos
  DEFAULT_SPICE = 0
  DEFAULT_VEGAN = true

  after_initialize :set_defaults

  def set_defaults
    self.spice ||= DEFAULT_SPICE
    self.vegan ||= DEFAULT_VEGAN
  end
  
  def is_vegan?
    return DEFAULT_VEGAN
  end
end
