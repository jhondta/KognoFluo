# frozen_string_literal: true

class CreateInventoryCategories < ActiveRecord::Migration[7.2]
  def change
    create_table :inventory_categories do |t|
      t.string :name, null: false, limit: 100, index: { unique: true }
      t.string :description, null: false, limit: 255

      t.timestamps
    end
  end
end
