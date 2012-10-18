require 'test_helper'

class GeocachingsControllerTest < ActionController::TestCase
  setup do
    @geocaching = geocachings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:geocachings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create geocaching" do
    assert_difference('Geocaching.count') do
      post :create, :geocaching => @geocaching.attributes
    end

    assert_redirected_to geocaching_path(assigns(:geocaching))
  end

  test "should show geocaching" do
    get :show, :id => @geocaching.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @geocaching.to_param
    assert_response :success
  end

  test "should update geocaching" do
    put :update, :id => @geocaching.to_param, :geocaching => @geocaching.attributes
    assert_redirected_to geocaching_path(assigns(:geocaching))
  end

  test "should destroy geocaching" do
    assert_difference('Geocaching.count', -1) do
      delete :destroy, :id => @geocaching.to_param
    end

    assert_redirected_to geocachings_path
  end
end
