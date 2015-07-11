require 'test_helper'

class TreatmentHistoriesControllerTest < ActionController::TestCase
  setup do
    @treatment_history = treatment_histories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:treatment_histories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create treatment_history" do
    assert_difference('TreatmentHistory.count') do
      post :create, treatment_history: { in_month_treated: @treatment_history.in_month_treated, in_year_treat_count: @treatment_history.in_year_treat_count, is_cured: @treatment_history.is_cured, na_session: @treatment_history.na_session, patient_id: @treatment_history.patient_id, total: @treatment_history.total }
    end

    assert_redirected_to treatment_history_path(assigns(:treatment_history))
  end

  test "should show treatment_history" do
    get :show, id: @treatment_history
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @treatment_history
    assert_response :success
  end

  test "should update treatment_history" do
    patch :update, id: @treatment_history, treatment_history: { in_month_treated: @treatment_history.in_month_treated, in_year_treat_count: @treatment_history.in_year_treat_count, is_cured: @treatment_history.is_cured, na_session: @treatment_history.na_session, patient_id: @treatment_history.patient_id, total: @treatment_history.total }
    assert_redirected_to treatment_history_path(assigns(:treatment_history))
  end

  test "should destroy treatment_history" do
    assert_difference('TreatmentHistory.count', -1) do
      delete :destroy, id: @treatment_history
    end

    assert_redirected_to treatment_histories_path
  end
end
