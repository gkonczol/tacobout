class CreateRatings < ActiveRecord::Migration[5.2]
  def change
    create_table :ratings do |t|
      t.integer :rating
      t.references :taco, foreign_key: true
      t.references :shop, foreign_key: true

      t.timestamps
    end
  end
end
