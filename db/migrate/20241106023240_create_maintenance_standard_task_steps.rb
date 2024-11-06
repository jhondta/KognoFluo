# frozen_string_literal: true

class CreateMaintenanceStandardTaskSteps < ActiveRecord::Migration[8.0]
  def change
    create_table :maintenance_standard_task_steps do |t|
      t.references :maintenance_standard_task, null: false, foreign_key: true
      t.integer :sequence_number, null: false, default: 1
      t.integer :estimated_duration

      t.timestamps
    end
  end
end
