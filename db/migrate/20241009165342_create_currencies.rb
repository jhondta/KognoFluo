# frozen_string_literal: true

class CreateCurrencies < ActiveRecord::Migration[7.2]
  def change
    create_table :currencies do |t|
      t.string :name, null: false, limit: 100, index: { unique: true }
      t.string :iso_code, null: false, limit: 3, index: { unique: true }
      t.string :symbol, null: false, limit: 10

      t.timestamps
    end
  end
end
