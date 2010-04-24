require 'test_helper'

class DecodesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:decodes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create decode" do
    assert_difference('Decode.count') do
      post :create, :decode => { }
    end

    assert_redirected_to decode_path(assigns(:decode))
  end

  test "should show decode" do
    get :show, :id => decodes(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => decodes(:one).to_param
    assert_response :success
  end

  test "should update decode" do
    put :update, :id => decodes(:one).to_param, :decode => { }
    assert_redirected_to decode_path(assigns(:decode))
  end

  test "should destroy decode" do
    assert_difference('Decode.count', -1) do
      delete :destroy, :id => decodes(:one).to_param
    end

    assert_redirected_to decodes_path
  end
end
