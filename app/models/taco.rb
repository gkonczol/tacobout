# frozen_string_literal: true

class Taco < ApplicationRecord
  has_one :shell
  has_one :shop
end
