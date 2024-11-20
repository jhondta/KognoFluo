# frozen_string_literal: true

class CreateMaintenanceAssignments < ActiveRecord::Migration[8.0]
  def change
    create_table :maintenance_assignments do |t|
      t.references :maintenance_schedule, null: false, foreign_key: true
      t.references :maintenance_technician, null: false, foreign_key: true
      t.integer :specialty_type, null: false
      t.decimal :assigned_hours
      t.integer :status, null: false, default: 0

      t.timestamps
    end

    add_index :maintenance_assignments,
              %i[maintenance_schedule_id maintenance_technician_id],
              unique: true
  end
end
