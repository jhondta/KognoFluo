# frozen_string_literal: true

class CreateMaintenanceAssetDocuments < ActiveRecord::Migration[7.2]
  def change
    create_table :maintenance_asset_documents do |t|
      t.references :maintenance_asset, null: false, foreign_key: true
      t.string :document_type, null: false, limit: 100
      t.string :name, null: false, limit: 100
      t.text :description
      t.string :version
      t.date :expiration_date
      t.integer :status, null: false, default: 1

      t.timestamps
    end
  end
end
