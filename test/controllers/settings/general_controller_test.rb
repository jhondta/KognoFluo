# frozen_string_literal: true

require 'test_helper'

class Settings::GeneralControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get settings_general_index_url
    assert_response :success
  end
end
