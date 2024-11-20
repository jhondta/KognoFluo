# frozen_string_literal: true

class CreateMaintenancePlanTaskMeasurements < ActiveRecord::Migration[8.0]
  def change
    create_table :maintenance_plan_task_measurements do |t|
      t.references :maintenance_plan_task, null: false, foreign_key: true
      t.string :name, null: false, limit: 100
      t.integer :measurement_type, null: false
      t.decimal :nominal_value
      t.decimal :min_value
      t.decimal :max_value
      t.decimal :tolerance_percentage
      t.boolean :is_critical, null: false, default: false

      t.timestamps
    end

    add_index :maintenance_plan_task_measurements, %i[maintenance_plan_task_id name],
              unique: true
  end
end
