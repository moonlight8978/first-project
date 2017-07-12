require 'test_helper'

class Vndb::CompaniesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @vndb_company = vndb_companies(:one)
  end

  test "should get index" do
    get vndb_companies_url, as: :json
    assert_response :success
  end

  test "should create vndb_company" do
    assert_difference('Vndb::Company.count') do
      post vndb_companies_url, params: { vndb_company: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show vndb_company" do
    get vndb_company_url(@vndb_company), as: :json
    assert_response :success
  end

  test "should update vndb_company" do
    patch vndb_company_url(@vndb_company), params: { vndb_company: {  } }, as: :json
    assert_response 200
  end

  test "should destroy vndb_company" do
    assert_difference('Vndb::Company.count', -1) do
      delete vndb_company_url(@vndb_company), as: :json
    end

    assert_response 204
  end
end
