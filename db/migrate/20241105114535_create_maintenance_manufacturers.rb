# frozen_string_literal: true

class CreateMaintenanceManufacturers < ActiveRecord::Migration[8.0]
  def change
    create_table :maintenance_manufacturers do |t|
      t.string :code, null: false
      t.string :name, null: false
      t.integer :status, null: false
      t.string :website
      t.string :support_phone
      t.string :suport_email
      t.text :notes

      t.timestamps
    end
  end
end
