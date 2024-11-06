# frozen_string_literal: true

class CreateMaintenancePlanTemplateTasks < ActiveRecord::Migration[8.0]
  def change
    create_table :maintenance_plan_template_tasks do |t|
      t.references :maintenance_plan_template, null: false, foreign_key: true
      t.references :maintenance_standard_task, null: false, foreign_key: true
      t.integer :sequence_number, null: false, default: 1
      t.integer :custom_duration
      t.text :custom_description

      t.timestamps
    end
  end
end
