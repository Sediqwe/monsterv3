require "application_system_test_case"

class GamelinksTest < ApplicationSystemTestCase
  setup do
    @gamelink = gamelinks(:one)
  end

  test "visiting the index" do
    visit gamelinks_url
    assert_selector "h1", text: "Gamelinks"
  end

  test "should create gamelink" do
    visit gamelinks_url
    click_on "New gamelink"

    fill_in "Game", with: @gamelink.game_id
    fill_in "Link", with: @gamelink.link
    fill_in "Linktype", with: @gamelink.linktype_id
    click_on "Create Gamelink"

    assert_text "Gamelink was successfully created"
    click_on "Back"
  end

  test "should update Gamelink" do
    visit gamelink_url(@gamelink)
    click_on "Edit this gamelink", match: :first

    fill_in "Game", with: @gamelink.game_id
    fill_in "Link", with: @gamelink.link
    fill_in "Linktype", with: @gamelink.linktype_id
    click_on "Update Gamelink"

    assert_text "Gamelink was successfully updated"
    click_on "Back"
  end

  test "should destroy Gamelink" do
    visit gamelink_url(@gamelink)
    click_on "Destroy this gamelink", match: :first

    assert_text "Gamelink was successfully destroyed"
  end
end
