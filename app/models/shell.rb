# frozen_string_literal: true

class Shell < ApplicationRecord
  enum primary_ingredient: { corn: 0, flower: 1 }
end
