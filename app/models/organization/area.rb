# frozen_string_literal: true

class Organization::Area < ApplicationRecord
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
  has_enum_state :status

  # -- -------------------------------------------------------------------------
  # -- Associations ------------------------------------------------------------
  belongs_to :plant, class_name: 'Organization::Plant',
             foreign_key: :organization_plant_id

  has_many :production_lines, class_name: 'Organization::ProductionLine',
           foreign_key: :organization_area_id, dependent: :restrict_with_error

  # -- -------------------------------------------------------------------------
  # -- Validations -------------------------------------------------------------
  validates :code, presence: true, length: { maximum: 10 },
            uniqueness: { scope: :organization_plant_id }
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
