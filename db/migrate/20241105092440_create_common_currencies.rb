# frozen_string_literal: true

class CreateCommonCurrencies < ActiveRecord::Migration[8.0]
  def change
    create_table :common_currencies do |t|
      t.string :name, null: false, limit: 100, index: { unique: true }
      t.string :code_alpha, null: false, limit: 3, index: { unique: true }
      t.string :code_numeric, null: false, limit: 3
      t.string :symbol, null: false, limit: 10

      t.timestamps
    end
  end
end
