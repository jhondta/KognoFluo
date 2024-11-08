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
  has_many :areas

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