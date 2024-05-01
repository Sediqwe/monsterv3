require "test_helper"

class GamelinksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @gamelink = gamelinks(:one)
  end

  test "should get index" do
    get gamelinks_url
    assert_response :success
  end

  test "should get new" do
    get new_gamelink_url
    assert_response :success
  end

  test "should create gamelink" do
    assert_difference("Gamelink.count") do
      post gamelinks_url, params: { gamelink: { game_id: @gamelink.game_id, link: @gamelink.link, linktype_id: @gamelink.linktype_id } }
    end

    assert_redirected_to gamelink_url(Gamelink.last)
  end

  test "should show gamelink" do
    get gamelink_url(@gamelink)
    assert_response :success
  end

  test "should get edit" do
    get edit_gamelink_url(@gamelink)
    assert_response :success
  end

  test "should update gamelink" do
    patch gamelink_url(@gamelink), params: { gamelink: { game_id: @gamelink.game_id, link: @gamelink.link, linktype_id: @gamelink.linktype_id } }
    assert_redirected_to gamelink_url(@gamelink)
  end

  test "should destroy gamelink" do
    assert_difference("Gamelink.count", -1) do
      delete gamelink_url(@gamelink)
    end

    assert_redirected_to gamelinks_url
  end
end
