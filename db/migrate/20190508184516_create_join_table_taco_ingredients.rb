class CreateJoinTableTacoIngredients < ActiveRecord::Migration[5.2]
  def change
    create_join_table :tacos, :ingredients do |t|
      t.index [:taco_id, :ingredient_id]
    end
  end
end
