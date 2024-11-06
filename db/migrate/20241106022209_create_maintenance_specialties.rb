# frozen_string_literal: true

class CreateMaintenanceSpecialties < ActiveRecord::Migration[8.0]
  def change
    create_table :maintenance_specialties do |t|
      t.string :code, null: false, limit: 10, index: { unique: true }
      t.string :name, null: false, limit: 100
      t.text :description

      t.timestamps
    end
  end
end
