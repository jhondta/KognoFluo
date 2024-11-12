# frozen_string_literal: true

class Organization::ProductionLine < ApplicationRecord
  # -- -------------------------------------------------------------------------
  # -- Constants ---------------------------------------------------------------
  STATUSES = %i[inactive active].freeze

  # -- -------------------------------------------------------------------------
  # -- Enums -------------------------------------------------------------------
  enum :status, STATUSES, validate: true

  # -- -------------------------------------------------------------------------
  # -- Associations ------------------------------------------------------------
  belongs_to :area, class_name: 'Organization::Area',
             foreign_key: :organization_area_id
  has_many :assets, class_name: 'Maintenance::Asset',
           foreign_key: :organization_production_line_id
  has_one :plant, through: :area

  # -- -------------------------------------------------------------------------
  # -- Scopes ------------------------------------------------------------------

  # -- -------------------------------------------------------------------------
  # -- Validations -------------------------------------------------------------
  validates :code, presence: true, length: { maximum: 10 }, uniqueness: true
  validates :name, presence: true, length: { maximum: 100 }

  # -- -------------------------------------------------------------------------
  # -- Callbacks ---------------------------------------------------------------

  # -- -------------------------------------------------------------------------
  # -- Delegations -------------------------------------------------------------

  # -- -------------------------------------------------------------------------
  # -- Methods -----------------------------------------------------------------
end
