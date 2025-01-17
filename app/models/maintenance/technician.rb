# frozen_string_literal: true

class Maintenance::Technician < ApplicationRecord
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
  belongs_to :user

  has_many :asset_assignees, class_name: 'Maintenance::AssetAssignee',
           foreign_key: :maintenance_technician_id,
           dependent: :restrict_with_error
  has_many :assets, through: :asset_assignees, class_name: 'Maintenance::Asset',
           foreign_key: :maintenance_asset_id,
           dependent: :restrict_with_error

  has_many :assignments, class_name: 'Maintenance::Assignment',
           foreign_key: :maintenance_technician_id,
           dependent: :restrict_with_error

  # -- -------------------------------------------------------------------------
  # -- Validations -------------------------------------------------------------
  validates :user_id, presence: true, uniqueness: true

  # -- -------------------------------------------------------------------------
  # -- Callbacks ---------------------------------------------------------------

  # -- -------------------------------------------------------------------------
  # -- Scopes ------------------------------------------------------------------

  # -- -------------------------------------------------------------------------
  # -- Delegations -------------------------------------------------------------
  delegate :full_name, to: :user
  delegate :email, to: :user
  delegate :profile, to: :user
  delegate :avatar, to: :user

  # -- -------------------------------------------------------------------------
  # -- Class Methods -----------------------------------------------------------

  # -- -------------------------------------------------------------------------
  # -- Instance Methods --------------------------------------------------------

  # -- -------------------------------------------------------------------------
  # -- Private Methods ---------------------------------------------------------
end
