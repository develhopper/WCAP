require 'test_helper'

class GonogosControllerTest < ActionController::TestCase
  setup do
    @gonogo = gonogos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gonogos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gonogo" do
    assert_difference('Gonogo.count') do
      post :create, gonogo: {  }
    end

    assert_redirected_to gonogo_path(assigns(:gonogo))
  end

  test "should show gonogo" do
    get :show, id: @gonogo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @gonogo
    assert_response :success
  end

  test "should update gonogo" do
    patch :update, id: @gonogo, gonogo: {  }
    assert_redirected_to gonogo_path(assigns(:gonogo))
  end

  test "should destroy gonogo" do
    assert_difference('Gonogo.count', -1) do
      delete :destroy, id: @gonogo
    end

    assert_redirected_to gonogos_path
  end
end
