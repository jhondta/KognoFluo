# frozen_string_literal: true

class CreateOrganizationPlants < ActiveRecord::Migration[8.0]
  def change
    create_table :organization_plants do |t|
      t.string :code, null: false, limit: 10, index: { unique: true }
      t.string :name, null: false, limit: 100
      t.text :address, null: false
      t.integer :status, null: false, default: 1

      t.timestamps
    end
  end
end
