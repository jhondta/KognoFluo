# frozen_string_literal: true

class CreateLanguages < ActiveRecord::Migration[7.2]
  def change
    create_table :languages do |t|
      t.string :name, null: false, limit: 255, index: { unique: true }
      t.string :iso_code2, null: false, limit: 2, index: { unique: true }
      t.string :iso_code3, null: false, limit: 3, index: { unique: true }

      t.timestamps
    end
  end
end
