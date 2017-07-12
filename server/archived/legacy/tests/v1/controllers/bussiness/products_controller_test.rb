require 'test_helper'

class Bussiness::ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bussiness_product = bussiness_products(:one)
  end

  test "should get index" do
    get bussiness_products_url, as: :json
    assert_response :success
  end

  test "should create bussiness_product" do
    assert_difference('Bussiness::Product.count') do
      post bussiness_products_url, params: { bussiness_product: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show bussiness_product" do
    get bussiness_product_url(@bussiness_product), as: :json
    assert_response :success
  end

  test "should update bussiness_product" do
    patch bussiness_product_url(@bussiness_product), params: { bussiness_product: {  } }, as: :json
    assert_response 200
  end

  test "should destroy bussiness_product" do
    assert_difference('Bussiness::Product.count', -1) do
      delete bussiness_product_url(@bussiness_product), as: :json
    end

    assert_response 204
  end
end
