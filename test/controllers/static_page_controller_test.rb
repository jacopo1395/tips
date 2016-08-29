require 'test_helper'

class StaticPageControllerTest < ActionDispatch::IntegrationTest
  test "should get profile" do
    get static_page_profile_url
    assert_response :success
  end

end
