# frozen_string_literal: true

class CreateInventoryStocks < ActiveRecord::Migration[7.2]
  def change
    create_table :inventory_stocks do |t|
      t.references :inventory_item, null: false, foreign_key: true
      t.references :inventory_warehouse, null: false, foreign_key: true
      t.integer :quantity, null: false, default: 0
      t.integer :minimum, null: false, default: 0
      t.integer :maximum, null: false, default: 0
      t.integer :reorder_quantity, null: false, default: 0

      t.timestamps
    end

    add_index :inventory_stocks, %i[inventory_item_id inventory_warehouse_id], unique: true
  end
end
