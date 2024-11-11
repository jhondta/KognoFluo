# frozen_string_literal: true

class Organization::Plant < ApplicationRecord
  # -- -------------------------------------------------------------------------
  # -- Constants ---------------------------------------------------------------
  STATUSES = %i[inactive active].freeze

  # -- -------------------------------------------------------------------------
  # -- Enums -------------------------------------------------------------------
  enum :status, STATUSES

  # -- -------------------------------------------------------------------------
  # -- Associations ------------------------------------------------------------
  has_many :areas, class_name: 'Organization::Area',
           foreign_key: :organization_plant_id, dependent: :restrict_with_error
  has_many :production_lines, through: :areas

  # -- -------------------------------------------------------------------------
  # -- Scopes ------------------------------------------------------------------

  # -- -------------------------------------------------------------------------
  # -- Validations -------------------------------------------------------------
  validates :code, presence: true, length: { maximum: 10 }, uniqueness: true
  validates :name, presence: true, length: { maximum: 100 }
  validates :address, presence: true
  validates :status, presence: true, inclusion: { in: STATUSES }

  # -- -------------------------------------------------------------------------
  # -- Callbacks ---------------------------------------------------------------

  # -- -------------------------------------------------------------------------
  # -- Delegations -------------------------------------------------------------

  # -- -------------------------------------------------------------------------
  # -- Methods -----------------------------------------------------------------
end
