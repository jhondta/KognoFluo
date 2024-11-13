# frozen_string_literal: true

class CreateOrganizationAreas < ActiveRecord::Migration[8.0]
  def change
    create_table :organization_areas do |t|
      t.references :organization_plant, null: false, foreign_key: true
      t.string :code, null: false, limit: 10
      t.string :name, null: false, limit: 100
      t.text :description
      t.integer :status, null: false, default: 1

      t.timestamps
    end

    add_index :organization_areas, %i[organization_plant_id code], unique: true
  end
end
