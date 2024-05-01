require "test_helper"

class LinktypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @linktype = linktypes(:one)
  end

  test "should get index" do
    get linktypes_url
    assert_response :success
  end

  test "should get new" do
    get new_linktype_url
    assert_response :success
  end

  test "should create linktype" do
    assert_difference("Linktype.count") do
      post linktypes_url, params: { linktype: { icon: @linktype.icon, name: @linktype.name } }
    end

    assert_redirected_to linktype_url(Linktype.last)
  end

  test "should show linktype" do
    get linktype_url(@linktype)
    assert_response :success
  end

  test "should get edit" do
    get edit_linktype_url(@linktype)
    assert_response :success
  end

  test "should update linktype" do
    patch linktype_url(@linktype), params: { linktype: { icon: @linktype.icon, name: @linktype.name } }
    assert_redirected_to linktype_url(@linktype)
  end

  test "should destroy linktype" do
    assert_difference("Linktype.count", -1) do
      delete linktype_url(@linktype)
    end

    assert_redirected_to linktypes_url
  end
end
