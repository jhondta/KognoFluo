# frozen_string_literal: true

class Maintenance::Plan < ApplicationRecord
  # -- -------------------------------------------------------------------------
  # -- Constants ---------------------------------------------------------------
  CRITICALITIES = %i[low medium high critical].freeze
  FREQUENCY_TYPES = %i[daily weekly monthly quarterly semiannually
                       yearly].freeze
  PLAN_TYPES = %i[preventive corrective predictive].freeze
  STATUSES = %i[draft active completed cancelled].freeze

  CRITICALITY_COLORS = { low: 'green', medium: 'yellow', high: 'orange',
                         critical: 'red' }.freeze
  PLAN_TYPE_COLORS = { preventive: 'blue', corrective: 'orange',
                       predictive: 'green' }.freeze
  STATUS_COLORS = { draft: 'gray', active: 'green', completed: 'blue',
                    cancelled: 'red' }.freeze

  # -- -------------------------------------------------------------------------
  # -- Concerns ----------------------------------------------------------------
  include HasEnumState

  # -- -------------------------------------------------------------------------
  # -- Attributes --------------------------------------------------------------

  # -- -------------------------------------------------------------------------
  # -- Extensions --------------------------------------------------------------

  # -- -------------------------------------------------------------------------
  # -- Enums -------------------------------------------------------------------
  has_enum_state :status, values: STATUSES, colors: STATUS_COLORS,
                 default: :draft
  has_enum_state :criticality, values: CRITICALITIES,
                 colors: CRITICALITY_COLORS, default: :low
  has_enum_state :plan_type, values: PLAN_TYPES, colors: PLAN_TYPE_COLORS,
                 default: :preventive
  enum :frequency_type, FREQUENCY_TYPES, validate: true

  # -- -------------------------------------------------------------------------
  # -- Associations ------------------------------------------------------------
  belongs_to :asset, class_name: 'Maintenance::Asset',
             foreign_key: :maintenance_asset_id
  belongs_to :component, class_name: 'Maintenance::AssetComponent',
             foreign_key: :maintenance_asset_component_id, optional: true

  has_many :resources, class_name: 'Maintenance::PlanResource',
           foreign_key: :maintenance_plan_id, dependent: :destroy
  has_many :tasks, class_name: 'Maintenance::PlanTask',
           foreign_key: :maintenance_plan_id, dependent: :destroy
  has_many :schedules, class_name: 'Maintenance::Schedule',
           foreign_key: :maintenance_plan_id, dependent: :destroy

  has_rich_text :notes

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
  # En el modelo
  def duration_hours
    estimated_duration ? (estimated_duration / 60).floor : 0
  end

  def duration_minutes
    estimated_duration ? (estimated_duration % 60) : 0
  end

  def duration_hours=(hours)
    self.estimated_duration = (hours.to_i * 60) + duration_minutes
  end

  def duration_minutes=(minutes)
    self.estimated_duration = (duration_hours * 60) + minutes.to_i
  end

  # -- -------------------------------------------------------------------------
  # -- Private Methods ---------------------------------------------------------
end
