require 'test_helper'

class User　inedxControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get user　inedx_show_url
    assert_response :success
  end

  test "should get edit" do
    get user　inedx_edit_url
    assert_response :success
  end

end
