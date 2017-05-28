require 'test_helper'

class Security::ResetPasswordTokensControllerTest < ActionDispatch::IntegrationTest
  setup do
    @security_reset_password_token = security_reset_password_tokens(:one)
  end

  test "should get index" do
    get security_reset_password_tokens_url, as: :json
    assert_response :success
  end

  test "should create security_reset_password_token" do
    assert_difference('Security::ResetPasswordToken.count') do
      post security_reset_password_tokens_url, params: { security_reset_password_token: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show security_reset_password_token" do
    get security_reset_password_token_url(@security_reset_password_token), as: :json
    assert_response :success
  end

  test "should update security_reset_password_token" do
    patch security_reset_password_token_url(@security_reset_password_token), params: { security_reset_password_token: {  } }, as: :json
    assert_response 200
  end

  test "should destroy security_reset_password_token" do
    assert_difference('Security::ResetPasswordToken.count', -1) do
      delete security_reset_password_token_url(@security_reset_password_token), as: :json
    end

    assert_response 204
  end
end
