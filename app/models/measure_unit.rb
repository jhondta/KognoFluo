# frozen_string_literal: true

class MeasureUnit < ApplicationRecord
  # Associations
  belongs_to :measure_unit_type

  # Validations
  validates :name, :abbreviation, :measure_unit_type_id, presence: true
  validates :name, uniqueness: true
end
