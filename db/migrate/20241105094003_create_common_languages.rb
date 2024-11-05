# frozen_string_literal: true

class CreateCommonLanguages < ActiveRecord::Migration[8.0]
  def change
    create_table :common_languages do |t|
      t.string :name, null: false, limit: 255, index: { unique: true }
      t.string :native_name, null: false, limit: 255, index: { unique: true }
      t.string :code_iso_639_1, null: false, limit: 2, index: { unique: true }
      t.string :code_iso_639_2, null: false, limit: 3, index: { unique: true }

      t.timestamps
    end
  end
end
