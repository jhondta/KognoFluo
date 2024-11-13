# frozen_string_literal: true

class CreateOrganizationProductionLines < ActiveRecord::Migration[8.0]
  def change
    create_table :organization_production_lines do |t|
      t.references :organization_area, null: false, foreign_key: true
      t.string :code, null: false, limit: 10
      t.string :name, null: false, limit: 100
      t.text :description
      t.integer :status, null: false, default: 1

      t.timestamps
    end

    add_index :organization_production_lines, %i[organization_area_id code],
              unique: true
  end
end
