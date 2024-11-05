# frozen_string_literal: true

class CreateCountryLanguages < ActiveRecord::Migration[7.2]
  def change
    create_table :country_languages, id: false do |t|
      t.references :country, null: false, foreign_key: true
      t.references :language, null: false, foreign_key: true
      t.boolean :is_primary, null: false, default: false
    end

    add_index :country_languages, %i[country_id language_id], unique: true
  end
end
