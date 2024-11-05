# frozen_string_literal: true

class CreateConfigurationAreas < ActiveRecord::Migration[7.2]
  def change
    create_table :configuration_areas do |t|
      t.string :code, null: false, limit: 10, index: { unique: true }
      t.string :name, null: false, limit: 100
      t.text :description, null: false, default: ''
      t.references :configuration_plant, null: false, foreign_key: true
      t.boolean :active, null: false, default: true

      t.timestamps
    end
  end
end
