# frozen_string_literal: true

class CreateMaintenanceAssetAssignees < ActiveRecord::Migration[7.2]
  def change
    create_table :maintenance_asset_assignees do |t|
      t.references :maintenance_asset, null: false, foreign_key: true
      t.references :maintenance_technician, null: false, foreign_key: true

      t.timestamps
    end

    add_index :maintenance_asset_assignees,
              %i[maintenance_asset_id maintenance_technician_id],
              unique: true
  end
end
