require "test_helper"

class GmessagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @gmessage = gmessages(:one)
  end

  test "should get index" do
    get gmessages_url
    assert_response :success
  end

  test "should get new" do
    get new_gmessage_url
    assert_response :success
  end

  test "should create gmessage" do
    assert_difference("Gmessage.count") do
      post gmessages_url, params: { gmessage: { game_id: @gmessage.game_id, gmessage_id: @gmessage.gmessage_id, senduser_id: @gmessage.senduser_id, title: @gmessage.title, user_id: @gmessage.user_id, warn: @gmessage.warn } }
    end

    assert_redirected_to gmessage_url(Gmessage.last)
  end

  test "should show gmessage" do
    get gmessage_url(@gmessage)
    assert_response :success
  end

  test "should get edit" do
    get edit_gmessage_url(@gmessage)
    assert_response :success
  end

  test "should update gmessage" do
    patch gmessage_url(@gmessage), params: { gmessage: { game_id: @gmessage.game_id, gmessage_id: @gmessage.gmessage_id, senduser_id: @gmessage.senduser_id, title: @gmessage.title, user_id: @gmessage.user_id, warn: @gmessage.warn } }
    assert_redirected_to gmessage_url(@gmessage)
  end

  test "should destroy gmessage" do
    assert_difference("Gmessage.count", -1) do
      delete gmessage_url(@gmessage)
    end

    assert_redirected_to gmessages_url
  end
end
