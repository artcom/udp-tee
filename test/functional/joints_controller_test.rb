require 'test_helper'

class JointsControllerTest < ActionController::TestCase
  setup do
    @joint = joints(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:joints)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create joint" do
    assert_difference('Joint.count') do
      post :create, joint: @joint.attributes
    end

    assert_redirected_to joint_path(assigns(:joint))
  end

  test "should show joint" do
    get :show, id: @joint.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @joint.to_param
    assert_response :success
  end

  test "should update joint" do
    put :update, id: @joint.to_param, joint: @joint.attributes
    assert_redirected_to joint_path(assigns(:joint))
  end

  test "should destroy joint" do
    assert_difference('Joint.count', -1) do
      delete :destroy, id: @joint.to_param
    end

    assert_redirected_to joints_path
  end
end
