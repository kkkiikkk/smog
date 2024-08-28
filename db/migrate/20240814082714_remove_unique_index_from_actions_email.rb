# frozen_string_literal: true

class RemoveUniqueIndexFromActionsEmail < ActiveRecord::Migration[7.1]
  def change
    remove_index :actions, column: :email, unique: true
  end
end
