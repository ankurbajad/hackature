require 'test_helper'

class StepsControllerTest < ActionController::TestCase
  test "should get step1" do
    get :step1
    assert_response :success
  end

end
