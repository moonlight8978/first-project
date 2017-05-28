require 'test_helper'

class Security::RolesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @security_role = security_roles(:one)
  end

  test "should get index" do
    get security_roles_url, as: :json
    assert_response :success
  end

  test "should create security_role" do
    assert_difference('Security::Role.count') do
      post security_roles_url, params: { security_role: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show security_role" do
    get security_role_url(@security_role), as: :json
    assert_response :success
  end

  test "should update security_role" do
    patch security_role_url(@security_role), params: { security_role: {  } }, as: :json
    assert_response 200
  end

  test "should destroy security_role" do
    assert_difference('Security::Role.count', -1) do
      delete security_role_url(@security_role), as: :json
    end

    assert_response 204
  end
end
