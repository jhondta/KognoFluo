# frozen_string_literal: true

class Organization::ProductionLine < ApplicationRecord
  # -- -------------------------------------------------------------------------
  # -- Constants ---------------------------------------------------------------

  # -- -------------------------------------------------------------------------
  # -- Concerns ----------------------------------------------------------------
  include HasEnumState

  # -- -------------------------------------------------------------------------
  # -- Attributes --------------------------------------------------------------

  # -- -------------------------------------------------------------------------
  # -- Extensions --------------------------------------------------------------

  # -- -------------------------------------------------------------------------
  # -- Enums -------------------------------------------------------------------
  has_enum_state :status, values: STATUSES

  # -- -------------------------------------------------------------------------
  # -- Associations ------------------------------------------------------------
  belongs_to :area, class_name: 'Organization::Area',
             foreign_key: :organization_area_id

  has_many :assets, class_name: 'Maintenance::Asset',
           foreign_key: :organization_production_line_id

  has_one :plant, through: :area

  # -- -------------------------------------------------------------------------
  # -- Validations -------------------------------------------------------------
  validates :code, presence: true, length: { maximum: 10 }, uniqueness: true
  validates :name, presence: true, length: { maximum: 100 }

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

  # -- -------------------------------------------------------------------------
  # -- Private Methods ---------------------------------------------------------
end
