require 'test_helper'

class Admin::GoodListsControllerTest < ActionController::TestCase
  setup do
    @admin_good_list = admin_good_lists(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_good_lists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_good_list" do
    assert_difference('Admin::GoodList.count') do
      post :create, admin_good_list: {  }
    end

    assert_redirected_to admin_good_list_path(assigns(:admin_good_list))
  end

  test "should show admin_good_list" do
    get :show, id: @admin_good_list
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_good_list
    assert_response :success
  end

  test "should update admin_good_list" do
    put :update, id: @admin_good_list, admin_good_list: {  }
    assert_redirected_to admin_good_list_path(assigns(:admin_good_list))
  end

  test "should destroy admin_good_list" do
    assert_difference('Admin::GoodList.count', -1) do
      delete :destroy, id: @admin_good_list
    end

    assert_redirected_to admin_good_lists_path
  end
end
