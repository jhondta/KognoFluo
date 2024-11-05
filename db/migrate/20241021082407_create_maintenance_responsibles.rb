# frozen_string_literal: true

class CreateMaintenanceResponsibles < ActiveRecord::Migration[7.2]
  def change
    create_table :maintenance_responsibles do |t|
      t.references :user, null: false, foreign_key: true, index: { unique: true }
      t.string :speciality, null: false, limit: 255, default: ''
      t.string :status, null: false, default: 'active'

      t.timestamps
    end

    add_index :maintenance_responsibles, :speciality
    add_index :maintenance_responsibles, :status
  end
end
