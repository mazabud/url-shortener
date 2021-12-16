require "test_helper"

class ShortsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @short = shorts(:one)
  end

  test "should get index" do
    get shorts_url, as: :json
    assert_response :success
  end

  test "should create short" do
    assert_difference('Short.count') do
      post shorts_url, params: { short: { clicked: @short.clicked, int: @short.int, shorturl: @short.shorturl, string: @short.string, url: @short.url } }, as: :json
    end

    assert_response 201
  end

  test "should show short" do
    get short_url(@short), as: :json
    assert_response :success
  end

  test "should update short" do
    patch short_url(@short), params: { short: { clicked: @short.clicked, int: @short.int, shorturl: @short.shorturl, string: @short.string, url: @short.url } }, as: :json
    assert_response 200
  end

  test "should destroy short" do
    assert_difference('Short.count', -1) do
      delete short_url(@short), as: :json
    end

    assert_response 204
  end
end
