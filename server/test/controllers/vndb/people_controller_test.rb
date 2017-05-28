require 'test_helper'

class Vndb::PeopleControllerTest < ActionDispatch::IntegrationTest
  setup do
    @vndb_person = vndb_people(:one)
  end

  test "should get index" do
    get vndb_people_url, as: :json
    assert_response :success
  end

  test "should create vndb_person" do
    assert_difference('Vndb::Person.count') do
      post vndb_people_url, params: { vndb_person: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show vndb_person" do
    get vndb_person_url(@vndb_person), as: :json
    assert_response :success
  end

  test "should update vndb_person" do
    patch vndb_person_url(@vndb_person), params: { vndb_person: {  } }, as: :json
    assert_response 200
  end

  test "should destroy vndb_person" do
    assert_difference('Vndb::Person.count', -1) do
      delete vndb_person_url(@vndb_person), as: :json
    end

    assert_response 204
  end
end
