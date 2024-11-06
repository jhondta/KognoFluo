# frozen_string_literal: true

class Maintenance::StandardTaskTool < ApplicationRecord
  # -- -------------------------------------------------------------------------
  # -- Constants ---------------------------------------------------------------

  # -- -------------------------------------------------------------------------
  # -- Enums -------------------------------------------------------------------

  # -- -------------------------------------------------------------------------
  # -- Associations ------------------------------------------------------------
  belongs_to :standard_task, class_name: 'Maintenance::StandardTask',
             foreign_key: :maintenance_standard_task_id
  belongs_to :tool, class_name: 'Maintenance::Tool',
             foreign_key: :maintenance_tool_id

  # -- -------------------------------------------------------------------------
  # -- Scopes ------------------------------------------------------------------

  # -- -------------------------------------------------------------------------
  # -- Validations -------------------------------------------------------------

  # -- -------------------------------------------------------------------------
  # -- Callbacks ---------------------------------------------------------------

  # -- -------------------------------------------------------------------------
  # -- Delegations -------------------------------------------------------------

  # -- -------------------------------------------------------------------------
  # -- Methods -----------------------------------------------------------------
end
