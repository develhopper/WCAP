require 'test_helper'

class BasicDemographicsControllerTest < ActionController::TestCase
  setup do
    @basic_demographic = basic_demographics(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:basic_demographics)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create basic_demographic" do
    assert_difference('BasicDemographic.count') do
      post :create, basic_demographic: { educational_year: @basic_demographic.educational_year, file_number: @basic_demographic.file_number, gender: @basic_demographic.gender, interview_date: @basic_demographic.interview_date, marital_status: @basic_demographic.marital_status, patient_id: @basic_demographic.patient_id, private_code: @basic_demographic.private_code, year_of_birth: @basic_demographic.year_of_birth }
    end

    assert_redirected_to basic_demographic_path(assigns(:basic_demographic))
  end

  test "should show basic_demographic" do
    get :show, id: @basic_demographic
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @basic_demographic
    assert_response :success
  end

  test "should update basic_demographic" do
    patch :update, id: @basic_demographic, basic_demographic: { educational_year: @basic_demographic.educational_year, file_number: @basic_demographic.file_number, gender: @basic_demographic.gender, interview_date: @basic_demographic.interview_date, marital_status: @basic_demographic.marital_status, patient_id: @basic_demographic.patient_id, private_code: @basic_demographic.private_code, year_of_birth: @basic_demographic.year_of_birth }
    assert_redirected_to basic_demographic_path(assigns(:basic_demographic))
  end

  test "should destroy basic_demographic" do
    assert_difference('BasicDemographic.count', -1) do
      delete :destroy, id: @basic_demographic
    end

    assert_redirected_to basic_demographics_path
  end
end
