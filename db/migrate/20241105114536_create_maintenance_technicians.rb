# frozen_string_literal: true

class CreateMaintenanceTechnicians < ActiveRecord::Migration[8.0]
  def change
    create_table :maintenance_technicians do |t|
      t.references :user, null: false, foreign_key: true
      t.string :specialty
      t.string :certificacion_level
      t.integer :status, null: false

      t.timestamps
    end
  end
end
