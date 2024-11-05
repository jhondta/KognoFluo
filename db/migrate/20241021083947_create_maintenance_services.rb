# frozen_string_literal: true

class CreateMaintenanceServices < ActiveRecord::Migration[7.2]
  def change
    create_table :maintenance_services do |t|
      t.string :name, null: false, limit: 255, index: { unique: true }
      t.text :description, null: false, default: ''
      t.datetime :scheduled_date, null: false, default: -> { 'CURRENT_TIMESTAMP' }
      t.references :maintenance_frequency, null: false, foreign_key: true
      t.references :maintenance_responsible, null: false, foreign_key: true
      t.string :status, null: false, default: 'active'
      t.text :resources, null: false, default: ''

      t.timestamps
    end

    add_index :maintenance_services, :scheduled_date
    add_index :maintenance_services, :status
  end
end
