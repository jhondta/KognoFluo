# frozen_string_literal: true

class CreateInventoryWarehouses < ActiveRecord::Migration[7.2]
  def change
    create_table :inventory_warehouses do |t|
      t.string :name, null: false, limit: 100, index: { unique: true }
      t.string :location, null: false, limit: 255

      t.timestamps
    end
  end
end
