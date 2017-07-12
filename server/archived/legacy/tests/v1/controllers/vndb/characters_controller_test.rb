require 'test_helper'

class Vndb::CharactersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @vndb_character = vndb_characters(:one)
  end

  test "should get index" do
    get vndb_characters_url, as: :json
    assert_response :success
  end

  test "should create vndb_character" do
    assert_difference('Vndb::Character.count') do
      post vndb_characters_url, params: { vndb_character: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show vndb_character" do
    get vndb_character_url(@vndb_character), as: :json
    assert_response :success
  end

  test "should update vndb_character" do
    patch vndb_character_url(@vndb_character), params: { vndb_character: {  } }, as: :json
    assert_response 200
  end

  test "should destroy vndb_character" do
    assert_difference('Vndb::Character.count', -1) do
      delete vndb_character_url(@vndb_character), as: :json
    end

    assert_response 204
  end
end
