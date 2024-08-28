# frozen_string_literal: true

class CreateActions < ActiveRecord::Migration[7.1]
  def change
    create_table :actions do |t|
      t.string :type
      t.string :email
      t.string :url
      t.date :timestamp

      t.timestamps
    end
    add_index :actions, :email, unique: true
  end
end
