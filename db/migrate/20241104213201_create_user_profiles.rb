# frozen_string_literal: true

class CreateUserProfiles < ActiveRecord::Migration[8.0]
  def change
    create_table :user_profiles do |t|
      t.references :user, index: { unique: true }, null: false, foreign_key: true
      t.string :first_name, null: false, limit: 255
      t.string :last_name, null: false, limit: 255
      t.date :birth_date, null: false
      t.integer :gender, null: false

      t.timestamps
    end

    add_index :user_profiles, :first_name
    add_index :user_profiles, :last_name
    add_index :user_profiles, :birth_date
    add_index :user_profiles, :gender
  end
end
