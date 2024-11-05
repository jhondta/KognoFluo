# frozen_string_literal: true

class CreateCountryTimezones < ActiveRecord::Migration[7.2]
  def change
    create_table :country_timezones, id: false do |t|
      t.references :country, null: false, foreign_key: true
      t.references :timezone, null: false, foreign_key: true
      t.boolean :is_primary, null: false, default: false
    end

    add_index :country_timezones, %i[country_id timezone_id], unique: true
  end
end
