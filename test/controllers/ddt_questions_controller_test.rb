require 'test_helper'

class DdtQuestionsControllerTest < ActionController::TestCase
  setup do
    @ddt_question = ddt_questions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ddt_questions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ddt_question" do
    assert_difference('DdtQuestion.count') do
      post :create, ddt_question: { definite_value: @ddt_question.definite_value, indefinite_value: @ddt_question.indefinite_value, question_type: @ddt_question.question_type, risk_rate: @ddt_question.risk_rate }
    end

    assert_redirected_to ddt_question_path(assigns(:ddt_question))
  end

  test "should show ddt_question" do
    get :show, id: @ddt_question
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ddt_question
    assert_response :success
  end

  test "should update ddt_question" do
    patch :update, id: @ddt_question, ddt_question: { definite_value: @ddt_question.definite_value, indefinite_value: @ddt_question.indefinite_value, question_type: @ddt_question.question_type, risk_rate: @ddt_question.risk_rate }
    assert_redirected_to ddt_question_path(assigns(:ddt_question))
  end

  test "should destroy ddt_question" do
    assert_difference('DdtQuestion.count', -1) do
      delete :destroy, id: @ddt_question
    end

    assert_redirected_to ddt_questions_path
  end
end
