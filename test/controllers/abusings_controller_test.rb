require 'test_helper'

class AbusingsControllerTest < ActionController::TestCase
  setup do
    @abusing = abusings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:abusings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create abusing" do
    assert_difference('Abusing.count') do
      post :create, abusing: { abusing_profile_id: @abusing.abusing_profile_id, continuous_usage_duration: @abusing.continuous_usage_duration, count: @abusing.count, description: @abusing.description, drug_type: @abusing.drug_type, first_use_age: @abusing.first_use_age, is_mainspring: @abusing.is_mainspring, type: @abusing.type }
    end

    assert_redirected_to abusing_path(assigns(:abusing))
  end

  test "should show abusing" do
    get :show, id: @abusing
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @abusing
    assert_response :success
  end

  test "should update abusing" do
    patch :update, id: @abusing, abusing: { abusing_profile_id: @abusing.abusing_profile_id, continuous_usage_duration: @abusing.continuous_usage_duration, count: @abusing.count, description: @abusing.description, drug_type: @abusing.drug_type, first_use_age: @abusing.first_use_age, is_mainspring: @abusing.is_mainspring, type: @abusing.type }
    assert_redirected_to abusing_path(assigns(:abusing))
  end

  test "should destroy abusing" do
    assert_difference('Abusing.count', -1) do
      delete :destroy, id: @abusing
    end

    assert_redirected_to abusings_path
  end
end
