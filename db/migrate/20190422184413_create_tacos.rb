class CreateTacos < ActiveRecord::Migration[5.2]
  def change
    create_table :tacos do |t|
      t.string :name
      t.string :description
      t.integer :shell_id
      t.integer :shop_id
      t.string :image_url

      t.timestamps
    end
  end
end
