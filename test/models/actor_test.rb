require 'test_helper'

class ActorTest < ActiveSupport::TestCase
  def setup
    @actor = Actor.new(title: "Example Actor", picture: "actor1.png",
                     description: "From local computer", 
                     eye_right_x: 100, eye_right_y: 80, 
                     eye_left_x: 200, eye_left_y: 80)
  end

  test "should be valid" do
    assert @actor.valid?
  end
  
  test "coords of eyes should be integer" do
    assert_instance_of Fixnum, @actor.eye_right_x
    assert_instance_of Fixnum, @actor.eye_right_y
    assert_instance_of Fixnum, @actor.eye_left_x
    assert_instance_of Fixnum, @actor.eye_left_y
  end
  
  test "eye_right_x should be integer" do
    @actor.eye_right_x = 100.1
    assert_not @actor.valid?
  end
  
  test "eye_right_x should be positive" do
    @actor.eye_right_x = -300
    assert_not @actor.valid?
  end
  
  test "eye_right_y should be integer" do
    @actor.eye_right_y = 100.1
    assert_not @actor.valid?
  end
  
  test "eye_right_y should be positive" do
    @actor.eye_right_y = -300
    assert_not @actor.valid?
  end
  
  test "eye_left_x should be integer" do
    @actor.eye_left_x = 100.1
    assert_not @actor.valid?
  end
  
  test "eye_left_x should be positive" do
    @actor.eye_left_x = -300
    assert_not @actor.valid?
  end

  test "eye_left_y should be integer" do
    @actor.eye_left_y = 100.1
    assert_not @actor.valid?
  end
  
  test "eye_left_y should be positive" do
    @actor.eye_left_y = -300
    assert_not @actor.valid?
  end
  
  test "eye_left_x should be greater than eye_right_x" do
    @actor.eye_right_x = 300
    @actor.eye_left_x = 200
    assert_not @actor.valid?
  end
  
  test "title should be at most 200 characters" do
    @actor.title = "a" * 201
    assert_not @actor.valid?
  end
  
  test "description should be at most 200 characters" do
    @actor.description = "a" * 201
    assert_not @actor.valid?
  end
  
  # test "title may be nil" do
  #   @actor.title = ''
  #   assert @actor.valid?
  # end
    
end
