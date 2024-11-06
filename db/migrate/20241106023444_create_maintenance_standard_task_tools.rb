# frozen_string_literal: true

class CreateMaintenanceStandardTaskTools < ActiveRecord::Migration[8.0]
  def change
    create_table :maintenance_standard_task_tools do |t|
      t.references :maintenance_standard_task, null: false, foreign_key: true
      t.references :maintenance_tool, null: false, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
