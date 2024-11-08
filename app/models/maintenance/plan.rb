# frozen_string_literal: true

class Maintenance::Plan < ApplicationRecord
  # -- -------------------------------------------------------------------------
  # -- Constants ---------------------------------------------------------------
  STATUSES = %i[inactive active].freeze

  # -- -------------------------------------------------------------------------
  # -- Enums -------------------------------------------------------------------

  # -- -------------------------------------------------------------------------
  # -- Associations ------------------------------------------------------------
  belongs_to :plan_template, class_name: 'Maintenance::PlanTemplate',
             foreign_key: :maintenance_plan_template_id
  belongs_to :asset, class_name: 'Maintenance::Asset',
             foreign_key: :maintenance_asset_id
  belongs_to :component, class_name: 'Maintenance::AssetComponent',
             foreign_key: :maintenance_asset_component_id

  has_many :schedules, class_name: 'Maintenance::Schedule',
           foreign_key: :maintenance_plan_id, dependent: :restrict_with_error

  has_rich_text :notes

  # -- -------------------------------------------------------------------------
  # -- Scopes ------------------------------------------------------------------

  # -- -------------------------------------------------------------------------
  # -- Validations -------------------------------------------------------------
  validates :status, presence: true, inclusion: { in: STATUSES }

  # -- -------------------------------------------------------------------------
  # -- Callbacks ---------------------------------------------------------------

  # -- -------------------------------------------------------------------------
  # -- Delegations -------------------------------------------------------------

  # -- -------------------------------------------------------------------------
  # -- Methods -----------------------------------------------------------------
end