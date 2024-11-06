# frozen_string_literal: true

class CreateMaintenanceFrequencyTypes < ActiveRecord::Migration[8.0]
  def change
    create_table :maintenance_frequency_types do |t|
      t.string :code, null: false, limit: 10, index: { unique: true }
      t.string :name, null: false, limit: 100
      t.references :common_measure_unit, null: false, foreign_key: true

      t.timestamps
    end
  end
end
