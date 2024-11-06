# frozen_string_literal: true

class Maintenance::PlanTemplate < ApplicationRecord
  # -- -------------------------------------------------------------------------
  # -- Constants ---------------------------------------------------------------
  STATUSES = %i[inactive active].freeze
  CRITICALITY_LEVELS = %i[low medium high critical].freeze

  # -- -------------------------------------------------------------------------
  # -- Enums -------------------------------------------------------------------
  enum :status, STATUSES
  enum :criticality, CRITICALITY_LEVELS

  # -- -------------------------------------------------------------------------
  # -- Associations ------------------------------------------------------------
  belongs_to :plan_type, class_name: 'Maintenance::PlanType',
             foreign_key: :maintenance_plan_type_id
  belongs_to :frequency_type, class_name: 'Maintenance::FrequencyType',
             foreign_key: :maintenance_frequency_type_id

  has_many :plans, class_name: 'Maintenance::Plan',
           foreign_key: :maintenance_plan_template_id
  has_many :plan_template_tasks, class_name: 'Maintenance::PlanTemplateTask',
           foreign_key: :maintenance_plan_template_id

  has_rich_text :safety_requirements

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
