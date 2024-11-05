# frozen_string_literal: true

class CreateCommonLanguages < ActiveRecord::Migration[8.0]
  def change
    create_table :common_languages do |t|
      t.string :name, null: false
      t.string :native_name, null: false
      t.string :code_iso_639_1, null: false
      t.string :code_iso_639_2, null: false

      t.timestamps
    end
  end
end
