# frozen_string_literal: true

class CreateMaintenanceSchedules < ActiveRecord::Migration[8.0]
  def change
    create_table :maintenance_schedules do |t|
      t.references :maintenance_plan, null: false, foreign_key: true
      t.datetime :planned_date, null: false
      t.integer :estimated_duration
      t.integer :status, null: false, default: 0
      t.string :priority

      t.timestamps
    end
  end
end
