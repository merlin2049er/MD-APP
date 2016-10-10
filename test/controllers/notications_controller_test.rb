require 'test_helper'

class NoticationsControllerTest < ActionController::TestCase
  setup do
    @notication = notications(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:notications)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create notication" do
    assert_difference('Notication.count') do
      post :create, notication: {  }
    end

    assert_redirected_to notication_path(assigns(:notication))
  end

  test "should show notication" do
    get :show, id: @notication
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @notication
    assert_response :success
  end

  test "should update notication" do
    patch :update, id: @notication, notication: {  }
    assert_redirected_to notication_path(assigns(:notication))
  end

  test "should destroy notication" do
    assert_difference('Notication.count', -1) do
      delete :destroy, id: @notication
    end

    assert_redirected_to notications_path
  end
end
