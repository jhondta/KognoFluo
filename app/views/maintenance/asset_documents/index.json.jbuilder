# frozen_string_literal: true

json.array! @maintenance_asset_documents, partial: 'maintenance/asset_documents/maintenance_asset_document', as: :maintenance_asset_document
