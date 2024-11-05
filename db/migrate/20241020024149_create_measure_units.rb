# frozen_string_literal: true

class CreateMeasureUnits < ActiveRecord::Migration[7.2]
  def change
    create_table :measure_units do |t|
      t.string :name, null: false, limit: 255, index: { unique: true }
      t.string :abbreviation, null: false, limit: 64
      t.references :measure_unit_type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
