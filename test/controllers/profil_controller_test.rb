require "test_helper"

class ProfilControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get profil_show_url
    assert_response :success
  end

  test "should get edit" do
    get profil_edit_url
    assert_response :success
  end

  test "should get update" do
    get profil_update_url
    assert_response :success
  end

  test "should get destroy" do
    get profil_destroy_url
    assert_response :success
  end
end
