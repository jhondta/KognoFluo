# frozen_string_literal: true

class CreateConfigurationPlants < ActiveRecord::Migration[7.2]
  def change
    create_table :configuration_plants do |t|
      t.string :code, null: false, limit: 10, index: { unique: true }
      t.string :name, null: false, limit: 100
      t.text :address, null: false, default: ''
      t.boolean :active, null: false, default: true

      t.timestamps
    end
  end
end
