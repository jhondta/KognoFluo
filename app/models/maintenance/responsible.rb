# frozen_string_literal: true

class Maintenance::Responsible < ApplicationRecord
  # Associations
  belongs_to :user, class_name: 'User', foreign_key: :user_id

  # Validations
  validates :user, presence: true, uniqueness: true
  validates :speciality, presence: true, allow_blank: true
  validates :status, presence: true, inclusion: { in: %w[active inactive] }

  # Scopes
  scope :active, -> { where(status: 'active') }
  scope :inactive, -> { where(status: 'inactive') }

  # Delegates
  delegate :email, to: :user
end
