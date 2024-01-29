require "application_system_test_case"

class GmessagesTest < ApplicationSystemTestCase
  setup do
    @gmessage = gmessages(:one)
  end

  test "visiting the index" do
    visit gmessages_url
    assert_selector "h1", text: "Gmessages"
  end

  test "should create gmessage" do
    visit gmessages_url
    click_on "New gmessage"

    fill_in "Game", with: @gmessage.game_id
    fill_in "Gmessage", with: @gmessage.gmessage_id
    fill_in "Senduser", with: @gmessage.senduser_id
    fill_in "Title", with: @gmessage.title
    fill_in "User", with: @gmessage.user_id
    check "Warn" if @gmessage.warn
    click_on "Create Gmessage"

    assert_text "Gmessage was successfully created"
    click_on "Back"
  end

  test "should update Gmessage" do
    visit gmessage_url(@gmessage)
    click_on "Edit this gmessage", match: :first

    fill_in "Game", with: @gmessage.game_id
    fill_in "Gmessage", with: @gmessage.gmessage_id
    fill_in "Senduser", with: @gmessage.senduser_id
    fill_in "Title", with: @gmessage.title
    fill_in "User", with: @gmessage.user_id
    check "Warn" if @gmessage.warn
    click_on "Update Gmessage"

    assert_text "Gmessage was successfully updated"
    click_on "Back"
  end

  test "should destroy Gmessage" do
    visit gmessage_url(@gmessage)
    click_on "Destroy this gmessage", match: :first

    assert_text "Gmessage was successfully destroyed"
  end
end
