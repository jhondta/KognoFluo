# frozen_string_literal: true

class CreateMaintenanceScheduleAssignments < ActiveRecord::Migration[8.0]
  def change
    create_table :maintenance_schedule_assignments do |t|
      t.references :maintenance_schedule, null: false, foreign_key: true
      t.references :maintenance_technician, null: false, foreign_key: true
      t.references :maintenance_specialty, null: false, foreign_key: true
      t.decimal :assigned_hours
      t.integer :status, null: false, default: 0

      t.timestamps
    end
  end
end
