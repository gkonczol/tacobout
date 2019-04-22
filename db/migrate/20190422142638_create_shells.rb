class CreateShells < ActiveRecord::Migration[5.2]
  def change
    create_table :shells do |t|

      t.timestamps
    end
  end
end
