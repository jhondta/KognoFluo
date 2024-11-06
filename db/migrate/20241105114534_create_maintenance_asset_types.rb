# frozen_string_literal: true

class CreateMaintenanceAssetTypes < ActiveRecord::Migration[8.0]
  def change
    create_table :maintenance_asset_types do |t|
      t.string :code, null: false, limit: 10, index: { unique: true }
      t.string :name, null: false, limit: 100
      t.text :description
      t.integer :status, null: false, default: 1

      t.timestamps
    end
  end
end
