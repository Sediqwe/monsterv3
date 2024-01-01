require "test_helper"

class IndexControllerTest < ActionDispatch::IntegrationTest
  test "should get start" do
    get index_start_url
    assert_response :success
  end
end
