# frozen_string_literal: true

class CreateMaintenanceAssetComponents < ActiveRecord::Migration[7.2]
  def change
    create_table :maintenance_asset_components do |t|
      t.references :maintenance_assets, null: false, foreign_key: true
      t.string :name, null: false, limit: 100
      t.text :description, null: false, default: ''
      t.integer :quantity, null: false, default: 0
      t.json :specifications
      t.integer :replacement_period, default: 0
      t.boolean :active, null: false, default: true

      t.timestamps
    end
  end
end
