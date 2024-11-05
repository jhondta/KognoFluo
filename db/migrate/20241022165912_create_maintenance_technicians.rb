# frozen_string_literal: true

class CreateMaintenanceTechnicians < ActiveRecord::Migration[7.2]
  def change
    create_table :maintenance_technicians do |t|
      t.references :user, null: false, foreign_key: true
      t.string :specialty, null: false, limit: 100
      t.string :certificacion_level
      t.boolean :active, null: false, default: true

      t.timestamps
    end
  end
end
