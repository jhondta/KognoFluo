# frozen_string_literal: true

class CreateMaintenanceEquipment < ActiveRecord::Migration[7.2]
  def change
    create_table :maintenance_equipment do |t|
      t.string :name, null: false, index: { unique: true }, limit: 100
      t.text :description, null: false, default: ''
      t.string :location, null: false, limit: 255, default: ''
      t.string :status, null: false, default: 'active'

      t.timestamps
    end
  end
end
