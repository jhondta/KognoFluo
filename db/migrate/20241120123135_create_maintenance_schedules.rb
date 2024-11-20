# frozen_string_literal: true

class CreateMaintenanceSchedules < ActiveRecord::Migration[8.0]
  def change
    create_table :maintenance_schedules do |t|
      t.references :maintenance_plan, null: false, foreign_key: true
      t.date :scheduled_date, null: false
      t.integer :status, null: false, default: 0

      t.timestamps
    end

    add_index :maintenance_schedules, :scheduled_date
  end
end
