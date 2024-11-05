# frozen_string_literal: true

class Maintenance::Equipment < ApplicationRecord
  # Associations
  has_one_attached :image

  # Validations
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true, allow_blank: true
  validates :image, presence: true, allow_blank: true
  validates :location, presence: true, allow_blank: true
  validates :status, presence: true
end
