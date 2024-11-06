# frozen_string_literal: true

class CreateMaintenancePlanTypes < ActiveRecord::Migration[8.0]
  def change
    create_table :maintenance_plan_types do |t|
      t.string :code, null: false, limit: 10, index: { unique: true }
      t.string :name, null: false, limit: 100

      t.timestamps
    end
  end
end
