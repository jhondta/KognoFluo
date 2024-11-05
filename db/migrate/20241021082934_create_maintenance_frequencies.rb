# frozen_string_literal: true

class CreateMaintenanceFrequencies < ActiveRecord::Migration[7.2]
  def change
    create_table :maintenance_frequencies do |t|
      t.string :name, null: false, index: { unique: true }, limit: 100
      t.string :description, null: false, default: '', limit: 255

      t.timestamps
    end
  end
end
