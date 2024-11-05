# frozen_string_literal: true

class CreateMeasureUnitTypes < ActiveRecord::Migration[7.2]
  def change
    create_table :measure_unit_types do |t|
      t.string :name, null: false, limit: 255, index: { unique: true }

      t.timestamps
    end
  end
end
