# frozen_string_literal: true

class CreateMaintenancePlans < ActiveRecord::Migration[8.0]
  def change
    create_table :maintenance_plans do |t|
      t.references :maintenance_plan_template, null: false, foreign_key: true
      t.references :maintenace_asset, null: false, foreign_key: true
      t.references :component, null: false, foreign_key: true
      t.integer :status, null: false, default: 0
      t.date :start_date
      t.date :last_execution_date
      t.date :next_execution_date

      t.timestamps
    end
  end
end
