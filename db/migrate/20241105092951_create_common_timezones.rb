# frozen_string_literal: true

class CreateCommonTimezones < ActiveRecord::Migration[8.0]
  def change
    create_table :common_timezones do |t|
      t.string :name, null: false, limit: 255, index: { unique: true }
      t.decimal :gmt_offset, null: false, precision: 3, scale: 1

      t.timestamps
    end
  end
end
