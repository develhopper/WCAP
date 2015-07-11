require 'test_helper'

class BartsControllerTest < ActionController::TestCase
  setup do
    @bart = barts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:barts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bart" do
    assert_difference('Bart.count') do
      post :create, bart: {  }
    end

    assert_redirected_to bart_path(assigns(:bart))
  end

  test "should show bart" do
    get :show, id: @bart
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @bart
    assert_response :success
  end

  test "should update bart" do
    patch :update, id: @bart, bart: {  }
    assert_redirected_to bart_path(assigns(:bart))
  end

  test "should destroy bart" do
    assert_difference('Bart.count', -1) do
      delete :destroy, id: @bart
    end

    assert_redirected_to barts_path
  end
end
