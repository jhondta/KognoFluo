# frozen_string_literal: true

class CreateCommonCurrencies < ActiveRecord::Migration[8.0]
  def change
    create_table :common_currencies do |t|
      t.string :name, null: false
      t.string :code_alpha, null: false
      t.string :code_numeric, null: false
      t.string :symbol, null: false

      t.timestamps
    end
  end
end
