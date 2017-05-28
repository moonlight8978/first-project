require 'test_helper'

class Vndb::NovelsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @vndb_novel = vndb_novels(:one)
  end

  test "should get index" do
    get vndb_novels_url, as: :json
    assert_response :success
  end

  test "should create vndb_novel" do
    assert_difference('Vndb::Novel.count') do
      post vndb_novels_url, params: { vndb_novel: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show vndb_novel" do
    get vndb_novel_url(@vndb_novel), as: :json
    assert_response :success
  end

  test "should update vndb_novel" do
    patch vndb_novel_url(@vndb_novel), params: { vndb_novel: {  } }, as: :json
    assert_response 200
  end

  test "should destroy vndb_novel" do
    assert_difference('Vndb::Novel.count', -1) do
      delete vndb_novel_url(@vndb_novel), as: :json
    end

    assert_response 204
  end
end
