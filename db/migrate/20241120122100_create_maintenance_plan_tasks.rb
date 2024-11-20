# frozen_string_literal: true

class CreateMaintenancePlanTasks < ActiveRecord::Migration[8.0]
  def change
    create_table :maintenance_plan_tasks do |t|
      t.references :maintenance_plan, null: false, foreign_key: true
      t.integer :sequence_number, null: false
      t.string :name, null: false, limit: 100
      t.text :description
      t.integer :estimated_duration
      t.boolean :requires_shutdown, null: false, default: false

      t.timestamps
    end

    add_index :maintenance_plan_tasks, :sequence_number
    add_index :maintenance_plan_tasks, %i[maintenance_plan_id sequence_number],
              unique: true
  end
end
