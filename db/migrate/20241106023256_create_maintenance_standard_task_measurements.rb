# frozen_string_literal: true

class CreateMaintenanceStandardTaskMeasurements < ActiveRecord::Migration[8.0]
  def change
    create_table :maintenance_standard_task_measurements do |t|
      t.references :maintenance_standard_task, null: false, foreign_key: true
      t.references :maintenance_measurement_type, null: false, foreign_key: true
      t.decimal :min_value
      t.decimal :max_value
      t.decimal :nominal_value
      t.decimal :tolerance_percentage
      t.boolean :is_critical

      t.timestamps
    end
  end
end
