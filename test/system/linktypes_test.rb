require "application_system_test_case"

class LinktypesTest < ApplicationSystemTestCase
  setup do
    @linktype = linktypes(:one)
  end

  test "visiting the index" do
    visit linktypes_url
    assert_selector "h1", text: "Linktypes"
  end

  test "should create linktype" do
    visit linktypes_url
    click_on "New linktype"

    fill_in "Icon", with: @linktype.icon
    fill_in "Name", with: @linktype.name
    click_on "Create Linktype"

    assert_text "Linktype was successfully created"
    click_on "Back"
  end

  test "should update Linktype" do
    visit linktype_url(@linktype)
    click_on "Edit this linktype", match: :first

    fill_in "Icon", with: @linktype.icon
    fill_in "Name", with: @linktype.name
    click_on "Update Linktype"

    assert_text "Linktype was successfully updated"
    click_on "Back"
  end

  test "should destroy Linktype" do
    visit linktype_url(@linktype)
    click_on "Destroy this linktype", match: :first

    assert_text "Linktype was successfully destroyed"
  end
end
