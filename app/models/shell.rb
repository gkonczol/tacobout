# frozen_string_literal: true

class Shell < ApplicationRecord
  enum primary_ingredient: { corn: 0, flour: 1 }
end
