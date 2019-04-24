# frozen_string_literal: true

class FixShellTypeColumnNameRollback < ActiveRecord::Migration[5.2]
  def change
    rename_column :shells, :type, :base
  end
end
