require 'test_helper'

class HeroTest < ActiveSupport::TestCase
  def setup
    @hero = Hero.new(title: "Example Hero", picture: "hero1.png",
                     description: "From local computer", 
                     eye_right_x: 100, eye_right_y: 80, 
                     eye_left_x: 200, eye_left_y: 80)
  end

  test "should be valid" do
    assert @hero.valid?
  end
  
  test "eye_right_x should be integer" do
    @hero.eye_right_x = 100.1
    assert_not @hero.valid?
  end
  
  test "eye_right_x should be positive" do
    @hero.eye_right_x = -300
    assert_not @hero.valid?
  end
  
  test "eye_right_x and eye_left_x should be 0 pair" do
    @hero.eye_right_x = 0
    @hero.eye_left_x = 0
    assert @hero.valid?
  end
  
  test "eye_right_y should be integer" do
    @hero.eye_right_y = 100.1
    assert_not @hero.valid?
  end
  
  test "eye_right_y should be positive" do
    @hero.eye_right_y = -300
    assert_not @hero.valid?
  end
  
  test "eye_right_y might 0" do
    @hero.eye_right_y = 0
    assert @hero.valid?
  end
  
  test "eye_left_x should be integer" do
    @hero.eye_left_x = 100.1
    assert_not @hero.valid?
  end
  
  test "eye_left_x should be positive" do
    @hero.eye_left_x = -300
    assert_not @hero.valid?
  end

  test "eye_left_x might 0" do
    @hero.eye_left_x = 0
    assert_not @hero.valid?
  end

  test "eye_left_y should be integer" do
    @hero.eye_left_y = 100.1
    assert_not @hero.valid?
  end
  
  test "eye_left_y should be positive" do
    @hero.eye_left_y = -300
    assert_not @hero.valid?
  end
  
  test "eye_left_y might 0" do
    @hero.eye_left_y = 0
    assert @hero.valid?
  end
  
  test "eye_left_x should be greater than eye_right_x" do
    @hero.eye_right_x = 300
    @hero.eye_left_x = 200
    assert_not @hero.valid?
  end
  
  test "title should be at most 200 characters" do
    @hero.title = "a" * 201
    assert_not @hero.valid?
  end
  
  test "description should be at most 200 characters" do
    @hero.description = "a" * 201
    assert_not @hero.valid?
  end
end
