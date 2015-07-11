require 'test_helper'

class DdtsControllerTest < ActionController::TestCase
  setup do
    @ddt = ddts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ddts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ddt" do
    assert_difference('Ddt.count') do
      post :create, ddt: {  }
    end

    assert_redirected_to ddt_path(assigns(:ddt))
  end

  test "should show ddt" do
    get :show, id: @ddt
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ddt
    assert_response :success
  end

  test "should update ddt" do
    patch :update, id: @ddt, ddt: {  }
    assert_redirected_to ddt_path(assigns(:ddt))
  end

  test "should destroy ddt" do
    assert_difference('Ddt.count', -1) do
      delete :destroy, id: @ddt
    end

    assert_redirected_to ddts_path
  end
end
