# frozen_string_literal: true

class RenameShellBaseToPrimaryIngredient < ActiveRecord::Migration[5.2]
  def change
    rename_column :shells, :base, :primary_ingredient
  end
end
