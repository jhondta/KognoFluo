# frozen_string_literal: true

class CreateCommonMeasureUnits < ActiveRecord::Migration[8.0]
  def change
    create_table :common_measure_units do |t|
      t.string :name, null: false, limit: 100, index: { unique: true }
      t.string :abbreviation, null: false, limit: 10
      t.references :common_measure_unit_type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
