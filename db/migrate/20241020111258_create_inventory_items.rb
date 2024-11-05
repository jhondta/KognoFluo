# frozen_string_literal: true

class CreateInventoryItems < ActiveRecord::Migration[7.2]
  def change
    create_table :inventory_items do |t|
      t.string :name, null: false, limit: 100
      t.string :sku, null: false, limit: 100, index: { unique: true }
      t.text :description, null: false
      t.references :measure_unit, null: false, foreign_key: true

      t.timestamps
    end

    add_index :inventory_items, :name
  end
end
