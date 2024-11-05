# frozen_string_literal: true

class UserProfile < ApplicationRecord
  belongs_to :user
  belongs_to :country
  has_one_attached :avatar do |attachable|
    attachable.variant :thumb, resize_to_limit: [100, 100], preprocessed: true
  end

  validates :first_name, :last_name, :date_of_birth, :country_id, :gender, presence: true
  validates :first_name, :last_name, length: { minimum: 2, maximum: 255 }
  validates :gender, inclusion: { in: %w[male female other] }
  validates :date_of_birth, comparison: { greater_than: Date.new(1900, 1, 1) }

  def full_name
    "#{first_name} #{last_name}"
  end

  def age
    (Date.today - date_of_birth).to_i
  end

  def age_in_years
    age / 365
  end
end
