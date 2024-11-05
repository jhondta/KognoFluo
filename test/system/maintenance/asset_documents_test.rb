# frozen_string_literal: true

require 'application_system_test_case'

class Maintenance::AssetDocumentsTest < ApplicationSystemTestCase
  setup do
    @maintenance_asset_document = maintenance_asset_documents(:one)
  end

  test 'visiting the index' do
    visit maintenance_asset_documents_url
    assert_selector 'h1', text: 'Asset documents'
  end

  test 'should create asset document' do
    visit maintenance_asset_documents_url
    click_on 'New asset document'

    check 'Active' if @maintenance_asset_document.active
    fill_in 'Description', with: @maintenance_asset_document.description
    fill_in 'Document type', with: @maintenance_asset_document.document_type
    fill_in 'Expiration date', with: @maintenance_asset_document.expiration_date
    fill_in 'Maintenance asset', with: @maintenance_asset_document.maintenance_asset_id
    fill_in 'Name', with: @maintenance_asset_document.name
    fill_in 'Version', with: @maintenance_asset_document.version
    click_on 'Create Asset document'

    assert_text 'Asset document was successfully created'
    click_on 'Back'
  end

  test 'should update Asset document' do
    visit maintenance_asset_document_url(@maintenance_asset_document)
    click_on 'Edit this asset document', match: :first

    check 'Active' if @maintenance_asset_document.active
    fill_in 'Description', with: @maintenance_asset_document.description
    fill_in 'Document type', with: @maintenance_asset_document.document_type
    fill_in 'Expiration date', with: @maintenance_asset_document.expiration_date
    fill_in 'Maintenance asset', with: @maintenance_asset_document.maintenance_asset_id
    fill_in 'Name', with: @maintenance_asset_document.name
    fill_in 'Version', with: @maintenance_asset_document.version
    click_on 'Update Asset document'

    assert_text 'Asset document was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Asset document' do
    visit maintenance_asset_document_url(@maintenance_asset_document)
    click_on 'Destroy this asset document', match: :first

    assert_text 'Asset document was successfully destroyed'
  end
end
