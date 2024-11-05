# frozen_string_literal: true

class MeasureUnitType < ApplicationRecord
  # Associations
  has_many :measure_units

  # Validations
  validates :name, presence: true, uniqueness: true, length: { maximum: 255 }
end
