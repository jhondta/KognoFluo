# frozen_string_literal: true

class Profile < ApplicationRecord
  # -- -------------------------------------------------------------------------
  # -- Constants ---------------------------------------------------------------
  GENDERS = %i[ female male non_binary other ].freeze

  # -- -------------------------------------------------------------------------
  # -- Concerns ----------------------------------------------------------------

  # -- -------------------------------------------------------------------------
  # -- Attributes --------------------------------------------------------------

  # -- -------------------------------------------------------------------------
  # -- Extensions --------------------------------------------------------------

  # -- -------------------------------------------------------------------------
  # -- Enums -------------------------------------------------------------------
  enum :gender, GENDERS, validate: true

  # -- -------------------------------------------------------------------------
  # -- Associations ------------------------------------------------------------
  belongs_to :user

  has_one_attached :avatar do |attachable|
    attachable.variant :thumb, resize_to_limit: [ 100, 100 ], preprocessed: true
  end

  has_rich_text :biography

  # -- -------------------------------------------------------------------------
  # -- Validations -------------------------------------------------------------
  validates :first_name, presence: true, length: { maximum: 255 }
  validates :last_name, presence: true, length: { maximum: 255 }
  validates :birth_date, presence: true

  # -- -------------------------------------------------------------------------
  # -- Callbacks ---------------------------------------------------------------

  # -- -------------------------------------------------------------------------
  # -- Scopes ------------------------------------------------------------------

  # -- -------------------------------------------------------------------------
  # -- Delegations -------------------------------------------------------------

  # -- -------------------------------------------------------------------------
  # -- Class Methods -----------------------------------------------------------

  # -- -------------------------------------------------------------------------
  # -- Instance Methods --------------------------------------------------------

  # @return [String] the full name of the user
  #
  def full_name
    "#{first_name} #{last_name}".strip
  end

  # @return [Integer] the age of the user in years
  #
  def age
    return if birth_date.blank?

    now = Time.now.utc.to_date
    now.year - birth_date.year - (now.month > birth_date.month ||
      (now.month == birth_date.month && now.day >= birth_date.day) ? 0 : 1)
  end

  # -- -------------------------------------------------------------------------
  # -- Private Methods ---------------------------------------------------------
end