# frozen_string_literal: true

class CreateMaintenanceTechnicians < ActiveRecord::Migration[8.0]
  def change
    create_table :maintenance_technicians do |t|
      t.references :user, null: false, foreign_key: true, index: { unique: true }
      t.string :specialty, limit: 100
      t.string :certification_level
      t.integer :status, null: false, default: 1

      t.timestamps
    end
  end
end
