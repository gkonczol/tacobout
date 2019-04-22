class CreateTacos < ActiveRecord::Migration[5.2]
  def change
    create_table :tacos do |t|

      t.timestamps
    end
  end
end
