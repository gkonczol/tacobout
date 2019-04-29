class CreateShells < ActiveRecord::Migration[5.2]
  def change
    create_table :shells do |t|
      t.integer :shell_type
      t.boolean :soft

      t.timestamps
    end
  end
end
