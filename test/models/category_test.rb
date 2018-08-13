require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  
  def setup
    @category=Category.new(name:"deportes")
  end 
  
  test "category valida" do
    assert @category.valid?
  end
  
  test "name present" do
    @category.name = " "
    assert_not @category.valid?
  end  
  
  test "name unique" do
    @category.save
    category2 = Category.new(name: "deportes")
    assert_not category2.valid?
  end  
  
  test "name not too long" do
    @category.name = "a" * 26
    assert_not @category.valid?
  end
  
  test "name not too short" do
    @category.name = "aa"
    assert_not @category.valid?
  end  
  
end  