require "test_helper"

class Public::StatusesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_statuses_index_url
    assert_response :success
  end
end
