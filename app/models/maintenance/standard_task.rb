# frozen_string_literal: true

class Maintenance::StandardTask < ApplicationRecord
  # -- -------------------------------------------------------------------------
  # -- Constants ---------------------------------------------------------------

  # -- -------------------------------------------------------------------------
  # -- Enums -------------------------------------------------------------------

  # -- -------------------------------------------------------------------------
  # -- Associations ------------------------------------------------------------
  belongs_to :task_category, class_name: 'Maintenance::TaskCategory',
             foreign_key: :maintenance_task_category_id

  has_many :plan_template_tasks, class_name: 'Maintenance::PlanTemplateTask',
           foreign_key: :maintenance_standard_task_id
  has_many :standard_task_measurements,
           class_name: 'Maintenance::StandardTaskMeasurement',
           foreign_key: :maintenance_standard_task_id,
           dependent: :restrict_with_error
  has_many :standard_task_steps, class_name: 'Maintenance::StandardTaskStep',
           foreign_key: :maintenance_standard_task_id,
           dependent: :restrict_with_error
  has_many :standard_task_tools, class_name: 'Maintenance::StandardTaskTool',
           foreign_key: :maintenance_standard_task_id,
           dependent: :restrict_with_error

  has_rich_text :safety_instructions

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
