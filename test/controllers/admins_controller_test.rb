require 'test_helper'

class AdminsControllerTest < ActionController::TestCase
  test "should get show_registrations" do
    get :show_registrations
    assert_response :success
  end

end
