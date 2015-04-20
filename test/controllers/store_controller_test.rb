require 'test_helper'

class StoreControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_select '.layout .header nav', 1
    assert_select '.layout .content', 1
    assert_select '.layout .footer', 1
    assert_select '.catalog .catalog__item', 3
    assert_select '.catalog .catalog__item:first-of-type td', 5
  end

end
