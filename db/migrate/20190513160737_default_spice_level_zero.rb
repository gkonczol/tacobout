class DefaultSpiceLevelZero < ActiveRecord::Migration[5.2]
  def change
    change_column_default(:ingredients, :spice, 0)
  end
end
