# frozen_string_literal: true

class Maintenance::Service < ApplicationRecord
  # Constants
  STATUSES = %i[ inactive active served cancelled expired ].freeze
  # Associations
  belongs_to :frequency, class_name: 'Maintenance::Frequency',
             foreign_key: :maintenance_frequency_id
  belongs_to :responsible, class_name: 'Maintenance::Responsible',
             foreign_key: :maintenance_responsible_id

  # Validations
  validates :name, presence: true, uniqueness: true,
            length: { minimum: 3, maximum: 255 }
  validates :description, presence: true, allow_blank: true
  validates :scheduled_date, comparison: { greater_than_or_equal_to: Date.today }
  validates :status, inclusion: { in: STATUSES.values }

  # Scopes

  # Enumerations
  enum :status, STATUSES
end
