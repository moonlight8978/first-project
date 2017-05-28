require 'test_helper'

class Security::InvalidTokensControllerTest < ActionDispatch::IntegrationTest
  setup do
    @security_invalid_token = security_invalid_tokens(:one)
  end

  test "should get index" do
    get security_invalid_tokens_url, as: :json
    assert_response :success
  end

  test "should create security_invalid_token" do
    assert_difference('Security::InvalidToken.count') do
      post security_invalid_tokens_url, params: { security_invalid_token: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show security_invalid_token" do
    get security_invalid_token_url(@security_invalid_token), as: :json
    assert_response :success
  end

  test "should update security_invalid_token" do
    patch security_invalid_token_url(@security_invalid_token), params: { security_invalid_token: {  } }, as: :json
    assert_response 200
  end

  test "should destroy security_invalid_token" do
    assert_difference('Security::InvalidToken.count', -1) do
      delete security_invalid_token_url(@security_invalid_token), as: :json
    end

    assert_response 204
  end
end
