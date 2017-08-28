require 'test_helper'

class WarningControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get warning_index_url
    assert_response :success
  end

end
