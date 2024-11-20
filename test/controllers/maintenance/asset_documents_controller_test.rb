# frozen_string_literal: true

require 'test_helper'

class Maintenance::AssetDocumentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @maintenance_asset_document = create(:maintenance_asset_document)
    sign_in shared_user
  end

  test 'should get index' do
    get maintenance_asset_documents_url
    assert_response :success
  end

  test 'should get new' do
    get new_maintenance_asset_document_url
    assert_response :success
  end

  test 'should create maintenance_asset_document' do
    assert_difference('Maintenance::AssetDocument.count') do
      post maintenance_asset_documents_url, params: { maintenance_asset_document: { active: @maintenance_asset_document.active, description: @maintenance_asset_document.description, document_type: @maintenance_asset_document.document_type, expiration_date: @maintenance_asset_document.expiration_date, maintenance_asset_id: @maintenance_asset_document.maintenance_asset_id, name: @maintenance_asset_document.name, version: @maintenance_asset_document.version } }
    end

    assert_redirected_to maintenance_asset_document_url(Maintenance::AssetDocument.last)
  end

  test 'should show maintenance_asset_document' do
    get maintenance_asset_document_url(@maintenance_asset_document)
    assert_response :success
  end

  test 'should get edit' do
    get edit_maintenance_asset_document_url(@maintenance_asset_document)
    assert_response :success
  end

  test 'should update maintenance_asset_document' do
    patch maintenance_asset_document_url(@maintenance_asset_document), params: { maintenance_asset_document: { active: @maintenance_asset_document.active, description: @maintenance_asset_document.description, document_type: @maintenance_asset_document.document_type, expiration_date: @maintenance_asset_document.expiration_date, maintenance_asset_id: @maintenance_asset_document.maintenance_asset_id, name: @maintenance_asset_document.name, version: @maintenance_asset_document.version } }
    assert_redirected_to maintenance_asset_document_url(@maintenance_asset_document)
  end

  test 'should destroy maintenance_asset_document' do
    assert_difference('Maintenance::AssetDocument.count', -1) do
      delete maintenance_asset_document_url(@maintenance_asset_document)
    end

    assert_redirected_to maintenance_asset_documents_url
  end
end
