# frozen_string_literal: true

class CreateInventoryItemCategories < ActiveRecord::Migration[7.2]
  def change
    create_table :inventory_item_categories do |t|
      t.references :inventory_item, null: false, foreign_key: true
      t.references :inventory_category, null: false, foreign_key: true
    end

    add_index :inventory_item_categories, %i[inventory_item_id inventory_category_id], unique: true
  end
end
