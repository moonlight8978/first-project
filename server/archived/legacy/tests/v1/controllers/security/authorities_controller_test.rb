require 'test_helper'

class Security::AuthoritiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @security_authority = security_authorities(:one)
  end

  test "should get index" do
    get security_authorities_url, as: :json
    assert_response :success
  end

  test "should create security_authority" do
    assert_difference('Security::Authority.count') do
      post security_authorities_url, params: { security_authority: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show security_authority" do
    get security_authority_url(@security_authority), as: :json
    assert_response :success
  end

  test "should update security_authority" do
    patch security_authority_url(@security_authority), params: { security_authority: {  } }, as: :json
    assert_response 200
  end

  test "should destroy security_authority" do
    assert_difference('Security::Authority.count', -1) do
      delete security_authority_url(@security_authority), as: :json
    end

    assert_response 204
  end
end
