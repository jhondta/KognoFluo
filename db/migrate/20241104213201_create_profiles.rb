# frozen_string_literal: true

class CreateProfiles < ActiveRecord::Migration[8.0]
  def change
    create_table :profiles do |t|
      t.references :user, index: { unique: true }, null: false, foreign_key: true
      t.string :first_name, null: false, limit: 255
      t.string :last_name, null: false, limit: 255
      t.date :birth_date, null: false
      t.integer :gender, null: false

      t.timestamps
    end

    add_index :profiles, :first_name
    add_index :profiles, :last_name
    add_index :profiles, :birth_date
    add_index :profiles, :gender
  end
end
