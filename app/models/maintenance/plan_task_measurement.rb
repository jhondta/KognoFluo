# frozen_string_literal: true

class Maintenance::PlanTaskMeasurement < ApplicationRecord
  # -- -------------------------------------------------------------------------
  # -- Constants ---------------------------------------------------------------
  MEASUREMENT_TYPES = %i[voltage current resistance temperature pressure
                         vibration].freeze

  # -- -------------------------------------------------------------------------
  # -- Concerns ----------------------------------------------------------------

  # -- -------------------------------------------------------------------------
  # -- Attributes --------------------------------------------------------------

  # -- -------------------------------------------------------------------------
  # -- Extensions --------------------------------------------------------------

  # -- -------------------------------------------------------------------------
  # -- Enums -------------------------------------------------------------------
  enum :measurement_type, MEASUREMENT_TYPES, validate: true

  # -- -------------------------------------------------------------------------
  # -- Associations ------------------------------------------------------------
  belongs_to :plan_task, class_name: 'Maintenance::PlanTask',
             foreign_key: :maintenance_plan_task_id

  # -- -------------------------------------------------------------------------
  # -- Validations -------------------------------------------------------------

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