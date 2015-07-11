require 'test_helper'

class AbusingProfilesControllerTest < ActionController::TestCase
  setup do
    @abusing_profile = abusing_profiles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:abusing_profiles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create abusing_profile" do
    assert_difference('AbusingProfile.count') do
      post :create, abusing_profile: { cost_per_month: @abusing_profile.cost_per_month, freakout_count: @abusing_profile.freakout_count, overdose_count: @abusing_profile.overdose_count, patient_id: @abusing_profile.patient_id }
    end

    assert_redirected_to abusing_profile_path(assigns(:abusing_profile))
  end

  test "should show abusing_profile" do
    get :show, id: @abusing_profile
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @abusing_profile
    assert_response :success
  end

  test "should update abusing_profile" do
    patch :update, id: @abusing_profile, abusing_profile: { cost_per_month: @abusing_profile.cost_per_month, freakout_count: @abusing_profile.freakout_count, overdose_count: @abusing_profile.overdose_count, patient_id: @abusing_profile.patient_id }
    assert_redirected_to abusing_profile_path(assigns(:abusing_profile))
  end

  test "should destroy abusing_profile" do
    assert_difference('AbusingProfile.count', -1) do
      delete :destroy, id: @abusing_profile
    end

    assert_redirected_to abusing_profiles_path
  end
end
