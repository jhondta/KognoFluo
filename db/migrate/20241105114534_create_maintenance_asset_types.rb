# frozen_string_literal: true

class CreateMaintenanceAssetTypes < ActiveRecord::Migration[8.0]
  def change
    create_table :maintenance_asset_types do |t|
      t.string :code, null: false
      t.string :name, null: false
      t.text :description
      t.integer :status, null: false

      t.timestamps
    end
  end
end
