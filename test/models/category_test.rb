require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  def setup
    @category = Category.new(title: "Test category", path: "cat1/", weight: 10)
  end
  test "should be valid" do
    assert @category.valid?
  end
  
  test "title should be present" do
    @category.title = "     "
    assert_not @category.valid?
  end
  
  test "path should be present" do
    @category.path = "     "
    assert_not @category.valid?
  end

  test "title should not be too long" do
    @category.title = "a" * 51
    assert_not @category.valid?
  end
  
  test "path should not be too long" do
    @category.path = "a" * 51
    assert_not @category.valid?
  end
  
  test "weight should be integer" do
    @category.weight = 1.1
    # assert_instance_of Fixnum, @category.weight
    assert_not @category.valid?
  end
  
  test "weight should be positive" do
    @category.weight = -3
    assert_not @category.valid?
  end
  
  test "weight may be nil" do
    @category.weight = nil
    assert @category.valid?
  end
  
  test "weight may be zerro" do
    @category.weight = 0
    assert @category.valid?
  end
end
