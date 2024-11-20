# frozen_string_literal: true

class CreateMaintenancePlanResources < ActiveRecord::Migration[8.0]
  def change
    create_table :maintenance_plan_resources do |t|
      t.references :maintenance_plan, null: false, foreign_key: true
      t.integer :resource_type, null: false
      t.references :maintenance_tool, null: false, foreign_key: true
      t.integer :specialty_type
      t.decimal :quantity
      t.decimal :hours_required

      t.timestamps
    end

    add_index :maintenance_plan_resources,
              %i[maintenance_plan_id resource_type maintenance_tool_id],
              unique: true
  end
end
