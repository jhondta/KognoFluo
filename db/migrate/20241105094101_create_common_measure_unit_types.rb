# frozen_string_literal: true

class CreateCommonMeasureUnitTypes < ActiveRecord::Migration[8.0]
  def change
    create_table :common_measure_unit_types do |t|
      t.string :name, null: false, limit: 100, index: { unique: true }

      t.timestamps
    end
  end
end
