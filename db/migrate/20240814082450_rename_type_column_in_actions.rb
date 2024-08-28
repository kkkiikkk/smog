# frozen_string_literal: true

class RenameTypeColumnInActions < ActiveRecord::Migration[7.1]
  def change
    rename_column :actions, :type, :action_type
  end
end
