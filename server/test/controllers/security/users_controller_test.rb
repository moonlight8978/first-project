require 'test_helper'

class Security::UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @security_user = security_users(:one)
  end

  test "should get index" do
    get security_users_url, as: :json
    assert_response :success
  end

  test "should create security_user" do
    assert_difference('Security::User.count') do
      post security_users_url, params: { security_user: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show security_user" do
    get security_user_url(@security_user), as: :json
    assert_response :success
  end

  test "should update security_user" do
    patch security_user_url(@security_user), params: { security_user: {  } }, as: :json
    assert_response 200
  end

  test "should destroy security_user" do
    assert_difference('Security::User.count', -1) do
      delete security_user_url(@security_user), as: :json
    end

    assert_response 204
  end
end
