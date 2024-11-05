# frozen_string_literal: true

class CreateOrganizationAreas < ActiveRecord::Migration[8.0]
  def change
    create_table :organization_areas do |t|
      t.string :code, null: false, limit: 10, index: { unique: true }
      t.string :name, null: false
      t.text :description
      t.references :organization_plant, null: false, foreign_key: true
      t.integer :status, null: false

      t.timestamps
    end
  end
end
