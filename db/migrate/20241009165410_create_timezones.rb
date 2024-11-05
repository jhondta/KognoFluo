# frozen_string_literal: true

class CreateTimezones < ActiveRecord::Migration[7.2]
  def change
    create_table :timezones do |t|
      t.string :name, null: false, limit: 255, index: { unique: true }
      t.decimal :gmt_offset, null: false, precision: 3, scale: 1

      t.timestamps
    end
  end
end
