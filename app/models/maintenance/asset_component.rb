# frozen_string_literal: true

class Maintenance::AssetComponent < ApplicationRecord
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
  belongs_to :asset, class_name: 'Maintenance::Asset',
             foreign_key: :maintenance_asset_id

  has_many :plans, class_name: 'Maintenance::Plan',
           foreign_key: :maintenance_asset_component_id

  # -- -------------------------------------------------------------------------
  # -- Validations -------------------------------------------------------------
  validates :name, presence: true, length: { maximum: 100 },
            uniqueness: { scope: %i[maintenance_asset_id] }

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
