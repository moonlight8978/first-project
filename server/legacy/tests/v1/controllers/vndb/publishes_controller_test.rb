require 'test_helper'

class Vndb::PublishesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @vndb_publish = vndb_publishes(:one)
  end

  test "should get index" do
    get vndb_publishes_url, as: :json
    assert_response :success
  end

  test "should create vndb_publish" do
    assert_difference('Vndb::Publish.count') do
      post vndb_publishes_url, params: { vndb_publish: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show vndb_publish" do
    get vndb_publish_url(@vndb_publish), as: :json
    assert_response :success
  end

  test "should update vndb_publish" do
    patch vndb_publish_url(@vndb_publish), params: { vndb_publish: {  } }, as: :json
    assert_response 200
  end

  test "should destroy vndb_publish" do
    assert_difference('Vndb::Publish.count', -1) do
      delete vndb_publish_url(@vndb_publish), as: :json
    end

    assert_response 204
  end
end
