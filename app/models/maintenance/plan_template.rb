# frozen_string_literal: true

class Maintenance::PlanTemplate < ApplicationRecord
  # -- -------------------------------------------------------------------------
  # -- Constants ---------------------------------------------------------------
  CRITICALITY_LEVELS = %i[low medium high critical].freeze
  CRITICALITY_COLORS = { low: 'green', medium: 'yellow', high: 'orange',
                         critical: 'red' }.freeze

  # -- -------------------------------------------------------------------------
  # -- Concerns ---------------------------------------------------------------
  include HasEnumState

  # -- -------------------------------------------------------------------------
  # -- Attributes --------------------------------------------------------------

  # -- -------------------------------------------------------------------------
  # -- Extensions --------------------------------------------------------------

  # -- -------------------------------------------------------------------------
  # -- Enums -------------------------------------------------------------------
  has_enum_state :status
  has_enum_state :criticality_level, values: CRITICALITY_LEVELS,
                 colors: CRITICALITY_COLORS, default: :low

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
