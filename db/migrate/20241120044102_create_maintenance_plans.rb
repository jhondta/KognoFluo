# frozen_string_literal: true

class CreateMaintenancePlans < ActiveRecord::Migration[8.0]
  def change
    create_table :maintenance_plans do |t|
      t.string :code, null: false, limit: 10, index: { unique: true }
      t.string :name, null: false, limit: 100
      t.text :description
      t.integer :plan_type, null: false, default: 0
      t.integer :status, null: false, default: 1
      t.integer :criticality, null: false, default: 0
      t.integer :frequency_type, null: false, default: 0
      t.integer :frequency_value
      t.integer :estimated_duration
      t.boolean :requires_shutdown, default: false
      t.references :maintenance_asset, null: false, foreign_key: true
      t.references :maintenance_asset_component, null: true, foreign_key: true
      t.datetime :start_date

      t.timestamps
    end
  end
end
