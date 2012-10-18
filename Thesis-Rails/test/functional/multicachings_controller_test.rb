require 'test_helper'

class MulticachingsControllerTest < ActionController::TestCase
  setup do
    @multicaching = multicachings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:multicachings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create multicaching" do
    assert_difference('Multicaching.count') do
      post :create, :multicaching => @multicaching.attributes
    end

    assert_redirected_to multicaching_path(assigns(:multicaching))
  end

  test "should show multicaching" do
    get :show, :id => @multicaching.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @multicaching.to_param
    assert_response :success
  end

  test "should update multicaching" do
    put :update, :id => @multicaching.to_param, :multicaching => @multicaching.attributes
    assert_redirected_to multicaching_path(assigns(:multicaching))
  end

  test "should destroy multicaching" do
    assert_difference('Multicaching.count', -1) do
      delete :destroy, :id => @multicaching.to_param
    end

    assert_redirected_to multicachings_path
  end
end
