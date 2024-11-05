# frozen_string_literal: true

class CreateMaintenanceManufacturers < ActiveRecord::Migration[7.2]
  def change
    create_table :maintenance_manufacturers do |t|
      t.string :code, null: false, limit: 10, index: { unique: true }
      t.string :name, null: false, limit: 100
      t.string :website, null: false, limit: 255, default: ''
      t.json :contact_info
      t.string :support_phone
      t.string :suport_email
      t.text :notes
      t.boolean :active, null: false, default: true

      t.timestamps
    end
  end
end
