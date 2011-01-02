require 'test_helper'

class AirlineProgramControllerTest < ActionController::TestCase
  test "should get airline" do
    get :airline
    assert_response :success
  end

end
