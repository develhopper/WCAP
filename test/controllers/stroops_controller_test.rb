require 'test_helper'

class StroopsControllerTest < ActionController::TestCase
  setup do
    @stroop = stroops(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:stroops)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create stroop" do
    assert_difference('Stroop.count') do
      post :create, stroop: { correct_items: @stroop.correct_items, duration: @stroop.duration, finished: @stroop.finished, total_items: @stroop.total_items }
    end

    assert_redirected_to stroop_path(assigns(:stroop))
  end

  test "should show stroop" do
    get :show, id: @stroop
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @stroop
    assert_response :success
  end

  test "should update stroop" do
    patch :update, id: @stroop, stroop: { correct_items: @stroop.correct_items, duration: @stroop.duration, finished: @stroop.finished, total_items: @stroop.total_items }
    assert_redirected_to stroop_path(assigns(:stroop))
  end

  test "should destroy stroop" do
    assert_difference('Stroop.count', -1) do
      delete :destroy, id: @stroop
    end

    assert_redirected_to stroops_path
  end
end
