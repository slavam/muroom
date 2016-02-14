require 'test_helper'

class HerosControllerTest < ActionController::TestCase
  def setup
    @hero = heros(:gerard)
  end
  

  test "should redirect new when not logged in" do
    get :new
    assert_not flash.empty?
    assert_redirected_to login_url
  end
  
  test "should redirect create when not logged in" do
    post :create, hero: { picture: "img.png"}
    assert_not flash.empty?
    assert_redirected_to login_url
  end
  
  test "should redirect show when not logged in" do
    get :show, id: @hero
    assert_not flash.empty?
    assert_redirected_to login_url
  end
end
