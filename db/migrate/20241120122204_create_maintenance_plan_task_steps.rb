# frozen_string_literal: true

class CreateMaintenancePlanTaskSteps < ActiveRecord::Migration[8.0]
  def change
    create_table :maintenance_plan_task_steps do |t|
      t.references :maintenance_plan_task, null: false, foreign_key: true
      t.integer :sequence_number, null: false
      t.text :description, null: false

      t.timestamps
    end

    add_index :maintenance_plan_task_steps, :sequence_number
    add_index :maintenance_plan_task_steps, %i[maintenance_plan_task_id sequence_number],
              unique: true
  end
end
