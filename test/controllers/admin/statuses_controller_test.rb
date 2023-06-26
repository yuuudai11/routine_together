require "test_helper"

class Admin::StatusesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_statuses_index_url
    assert_response :success
  end

  test "should get edit" do
    get admin_statuses_edit_url
    assert_response :success
  end

  test "should get update" do
    get admin_statuses_update_url
    assert_response :success
  end

  test "should get create" do
    get admin_statuses_create_url
    assert_response :success
  end
end
