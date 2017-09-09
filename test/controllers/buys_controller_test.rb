require 'test_helper'

class BuysControllerTest < ActionController::TestCase
  setup do
    @buy = buys(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:buys)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create buy" do
    assert_difference('Buy.count') do
      post :create, buy: { currency_input_id: @buy.currency_input_id, currency_out_id: @buy.currency_out_id, customer_id: @buy.customer_id, input_value: @buy.input_value, out_value: @buy.out_value, user_id: @buy.user_id }
    end

    assert_redirected_to buy_path(assigns(:buy))
  end

  test "should show buy" do
    get :show, id: @buy
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @buy
    assert_response :success
  end

  test "should update buy" do
    patch :update, id: @buy, buy: { currency_input_id: @buy.currency_input_id, currency_out_id: @buy.currency_out_id, customer_id: @buy.customer_id, input_value: @buy.input_value, out_value: @buy.out_value, user_id: @buy.user_id }
    assert_redirected_to buy_path(assigns(:buy))
  end

  test "should destroy buy" do
    assert_difference('Buy.count', -1) do
      delete :destroy, id: @buy
    end

    assert_redirected_to buys_path
  end
end
