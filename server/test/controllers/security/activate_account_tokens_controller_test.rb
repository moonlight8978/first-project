require 'test_helper'

class Security::ActivateAccountTokensControllerTest < ActionDispatch::IntegrationTest
  setup do
    @security_activate_account_token = security_activate_account_tokens(:one)
  end

  test "should get index" do
    get security_activate_account_tokens_url, as: :json
    assert_response :success
  end

  test "should create security_activate_account_token" do
    assert_difference('Security::ActivateAccountToken.count') do
      post security_activate_account_tokens_url, params: { security_activate_account_token: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show security_activate_account_token" do
    get security_activate_account_token_url(@security_activate_account_token), as: :json
    assert_response :success
  end

  test "should update security_activate_account_token" do
    patch security_activate_account_token_url(@security_activate_account_token), params: { security_activate_account_token: {  } }, as: :json
    assert_response 200
  end

  test "should destroy security_activate_account_token" do
    assert_difference('Security::ActivateAccountToken.count', -1) do
      delete security_activate_account_token_url(@security_activate_account_token), as: :json
    end

    assert_response 204
  end
end
