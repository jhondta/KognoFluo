# frozen_string_literal: true

class CreateUserProfiles < ActiveRecord::Migration[7.2]
  def change
    create_table :user_profiles do |t|
      t.references :user, null: false, foreign_key: true, index: { unique: true }
      t.string :first_name, null: false, limit: 255
      t.string :last_name, null: false, limit: 255
      t.date :date_of_birth, null: false
      t.references :country, null: false, foreign_key: true
      t.string :gender, null: false

      t.timestamps
    end

    add_index :user_profiles, :first_name
    add_index :user_profiles, :last_name
    add_index :user_profiles, :date_of_birth
    add_index :user_profiles, :gender
  end
end
