# frozen_string_literal: true

class CreateMaintenanceAssetComponents < ActiveRecord::Migration[7.2]
  def change
    create_table :maintenance_asset_components do |t|
      t.references :maintenance_asset, null: false, foreign_key: true
      t.string :name, null: false, limit: 100
      t.text :description
      t.integer :quantity
      t.json :specifications
      t.integer :replacement_period
      t.integer :status, null: false, default: 1

      t.timestamps
    end
  end
end
