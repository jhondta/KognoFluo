# frozen_string_literal: true

json.array! @organization_production_lines, partial: 'organization/production_lines/organization_production_line', as: :organization_production_line
