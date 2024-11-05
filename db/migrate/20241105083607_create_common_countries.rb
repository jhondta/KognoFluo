# frozen_string_literal: true

class CreateCommonCountries < ActiveRecord::Migration[8.0]
  def change
    create_table :common_countries do |t|
      t.string :common_name, null: false, limit: 100, index: { unique: true }
      t.string :official_name, null: false, limit: 100, index: { unique: true }
      t.string :code_alpha2, null: false, limit: 2, index: { unique: true }
      t.string :code_alpha3, null: false, limit: 3, index: { unique: true }
      t.string :phone_code, null: false, limit: 10
      t.string :tld, null: false, limit: 5
      t.text :flag_svg, null: false
      t.binary :flag_png, null: false

      t.timestamps
    end
  end
end
