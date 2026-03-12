require "test_helper"

class LandlordProfilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    sign_in_as(@user)
    @landlord_profile = landlord_profiles(:one)
  end
  test "should get index" do
    get landlord_profiles_index_url
    assert_response :success
  end

  test "should get show" do
    get landlord_profiles_show_url
    assert_response :success
  end

  test "should get new" do
    get landlord_profiles_new_url
    assert_response :success
  end
end
