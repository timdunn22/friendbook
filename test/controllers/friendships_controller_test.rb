require 'test_helper'

class FriendshipsControllerTest < ActionController::TestCase
  test "should get newcreate" do
    get :newcreate
    assert_response :success
  end

  test "should get destroy" do
    get :destroy
    assert_response :success
  end

end
