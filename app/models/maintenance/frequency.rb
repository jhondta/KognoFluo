# frozen_string_literal: true

class Maintenance::Frequency < ApplicationRecord
  # Associations

  # Validations
  validates :name, presence: true, uniqueness: true,
            length: { minimum: 3, maximum: 100 }
  validates :description, length: { maximum: 255 }, allow_blank: true
end
