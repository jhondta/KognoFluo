# frozen_string_literal: true

class CreateMaintenanceStandardTasks < ActiveRecord::Migration[8.0]
  def change
    create_table :maintenance_standard_tasks do |t|
      t.string :code, null: false, limit: 10, index: { unique: true }
      t.string :name, null: false, limit: 100
      t.text :description
      t.references :maintenance_task_category, null: false, foreign_key: true
      t.integer :estimated_duration
      t.boolean :requires_shutdown

      t.timestamps
    end
  end
end
