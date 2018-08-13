require 'test_helper'
 
class CategoriesControllerTest < ActionController::TestCase
  
  def setup
    @category = Category.create(name: "Deportes")
  end  
  
  test "categories index" do
    get :index
    assert_response :success
  end
  
  test "get new" do
    get :new
    assert_response :success
  end
  
  test "get show" do
    get(:show, {'id' => @category.id})
    assert_response :success
  end  
  
end  