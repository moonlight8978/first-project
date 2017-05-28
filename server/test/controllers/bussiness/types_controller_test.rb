require 'test_helper'

class Bussiness::TypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bussiness_type = bussiness_types(:one)
  end

  test "should get index" do
    get bussiness_types_url, as: :json
    assert_response :success
  end

  test "should create bussiness_type" do
    assert_difference('Bussiness::Type.count') do
      post bussiness_types_url, params: { bussiness_type: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show bussiness_type" do
    get bussiness_type_url(@bussiness_type), as: :json
    assert_response :success
  end

  test "should update bussiness_type" do
    patch bussiness_type_url(@bussiness_type), params: { bussiness_type: {  } }, as: :json
    assert_response 200
  end

  test "should destroy bussiness_type" do
    assert_difference('Bussiness::Type.count', -1) do
      delete bussiness_type_url(@bussiness_type), as: :json
    end

    assert_response 204
  end
end
