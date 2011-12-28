require 'test_helper'

module WhurlEngine
  class ApiCallControllerTest < ActionController::TestCase
    test "should get new" do
      get :new
      assert_response :success
    end
  
    test "should get create" do
      get :create
      assert_response :success
    end
  
    test "should get edit" do
      get :edit
      assert_response :success
    end
  
  end
end
