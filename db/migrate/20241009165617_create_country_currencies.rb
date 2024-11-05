# frozen_string_literal: true

class CreateCountryCurrencies < ActiveRecord::Migration[7.2]
  def change
    create_table :country_currencies, id: false do |t|
      t.references :country, null: false, foreign_key: true
      t.references :currency, null: false, foreign_key: true
      t.boolean :is_primary, null: false, default: false
    end

    add_index :country_currencies, %i[country_id currency_id], unique: true
  end
end
