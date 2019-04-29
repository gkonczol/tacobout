# frozen_string_literal: true

class FixShellTypeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :shells, :shell_type, :type
  end
end
