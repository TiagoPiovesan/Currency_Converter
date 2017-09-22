require 'test_helper'

class ReportControllerTest < ActionController::TestCase
  test "should get report_sell" do
    get :report_sell
    assert_response :success
  end

  test "should get report_buy" do
    get :report_buy
    assert_response :success
  end

end
