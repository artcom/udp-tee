require 'test_helper'

class FanOutsControllerTest < ActionController::TestCase
  setup do
    @fan_out = fan_outs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fan_outs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fan_out" do
    assert_difference('FanOut.count') do
      post :create, fan_out: @fan_out.attributes
    end

    assert_redirected_to fan_out_path(assigns(:fan_out))
  end

  test "should show fan_out" do
    get :show, id: @fan_out.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @fan_out.to_param
    assert_response :success
  end

  test "should update fan_out" do
    put :update, id: @fan_out.to_param, fan_out: @fan_out.attributes
    assert_redirected_to fan_out_path(assigns(:fan_out))
  end

  test "should destroy fan_out" do
    assert_difference('FanOut.count', -1) do
      delete :destroy, id: @fan_out.to_param
    end

    assert_redirected_to fan_outs_path
  end
end
