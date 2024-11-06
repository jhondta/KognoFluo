# frozen_string_literal: true

class CreateMaintenanceManufacturers < ActiveRecord::Migration[8.0]
  def change
    create_table :maintenance_manufacturers do |t|
      t.string :code, null: false, limit: 10, index: { unique: true }
      t.string :name, null: false, limit: 100
      t.integer :status, null: false, default: 1
      t.string :website
      t.string :support_phone
      t.string :suport_email

      t.timestamps
    end
  end
end
