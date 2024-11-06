# frozen_string_literal: true

class CreateOrganizationProductionLines < ActiveRecord::Migration[8.0]
  def change
    create_table :organization_production_lines do |t|
      t.string :code, null: false, limit: 10, index: { unique: true }
      t.string :name, null: false, limit: 100
      t.text :description
      t.references :organization_area, null: false, foreign_key: true
      t.integer :status, null: false, default: 1

      t.timestamps
    end
  end
end
