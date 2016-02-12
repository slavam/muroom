require 'test_helper'

class ActorsControllerTest < ActionController::TestCase
  def setup
    @actor = actors(:alen)
  end

  test "should redirect new when not logged in" do
    get :new
    assert_not flash.empty?
    assert_redirected_to login_url
  end
  
  test "should redirect create when not logged in" do
    post :create, actor: { picture: "img.png", eye_right_x: 1, eye_right_y: 1, eye_left_x: 2, eye_left_y: 1 }
    assert_not flash.empty?
    assert_redirected_to login_url
  end
  
  test "should redirect show when not logged in" do
    get :show, id: @actor
    assert_not flash.empty?
    assert_redirected_to login_url
  end
end
