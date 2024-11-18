# frozen_string_literal: true

class CreateMaintenancePlanTemplates < ActiveRecord::Migration[8.0]
  def change
    create_table :maintenance_plan_templates do |t|
      t.string :code, null: false, limit: 10, index: { unique: true }
      t.string :name, null: false, limit: 100
      t.text :description
      t.references :maintenance_plan_type, null: false, foreign_key: true
      t.references :maintenance_frequency_type, null: false, foreign_key: true
      t.integer :frequency_value
      t.integer :estimated_duration
      t.boolean :requires_shutdown, default: false
      t.integer :criticality_level, default: 0

      t.timestamps
    end
  end
end
