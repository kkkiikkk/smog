# frozen_string_literal: true

class AddCategoryToImage < ActiveRecord::Migration[7.1]
  def change
    add_reference :images, :category, foreign_key: true
  end
end
