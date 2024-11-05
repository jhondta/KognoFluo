# frozen_string_literal: true

class CreateCountries < ActiveRecord::Migration[7.2]
  def change
    create_table :countries do |t|
      t.string :common_name, null: false, limit: 100, index: { unique: true }
      t.string :official_name, null: false, limit: 100, index: { unique: true }
      t.string :iso_code2, limit: 2, null: false, index: { unique: true }
      t.string :iso_code3, limit: 3, null: false, index: { unique: true }
      t.string :phone_code, limit: 10, null: false
      t.string :tld, limit: 5, null: false
      t.text :flag_svg, null: false
      t.binary :flag_png, null: false

      t.timestamps
    end
  end
end
