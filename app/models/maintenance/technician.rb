# frozen_string_literal: true

class Maintenance::Technician < ApplicationRecord
  # -- -------------------------------------------------------------------------
  # -- Constants ---------------------------------------------------------------
  STATUSES = %i[inactive active].freeze

  # -- -------------------------------------------------------------------------
  # -- Enums -------------------------------------------------------------------
  enum :status, STATUSES

  # -- -------------------------------------------------------------------------
  # -- Associations ------------------------------------------------------------
  belongs_to :user

  has_many :asset_assignees, class_name: 'Maintenance::AssetAssignee',
           foreign_key: :maintenance_technician_id, dependent: :restrict_with_error
  has_many :assets, through: :asset_assignees, class_name: 'Maintenance::Asset',
           foreign_key: :maintenance_asset_id, dependent: :restrict_with_error
  has_many :schedule_assignments, class_name: 'Maintenance::ScheduleAssignment',
           foreign_key: :maintenance_technician_id, dependent: :restrict_with_error

  # -- -------------------------------------------------------------------------
  # -- Scopes ------------------------------------------------------------------

  # -- -------------------------------------------------------------------------
  # -- Validations -------------------------------------------------------------
  validates :user, presence: true
  validates :status, presence: true, inclusion: { in: STATUSES.map(&:to_s) }

  # -- -------------------------------------------------------------------------
  # -- Callbacks ---------------------------------------------------------------

  # -- -------------------------------------------------------------------------
  # -- Delegations -------------------------------------------------------------
  delegate :full_name, to: :user
  delegate :email, to: :user

  # -- -------------------------------------------------------------------------
  # -- Methods -----------------------------------------------------------------
end
