# frozen_string_literal: true

class CreateMaintenanceAssetTypes < ActiveRecord::Migration[7.2]
  def change
    create_table :maintenance_asset_types do |t|
      t.string :code
      t.string :name
      t.text :description
      t.boolean :requires_calibration
      t.integer :maintenance_frequency
      t.boolean :active

      t.timestamps
    end
  end
end
