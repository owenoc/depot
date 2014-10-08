require 'test_helper'

class StoreControllerTest < ActionController::TestCase
  test "should get index" do
    assert_select '#columns #side a', minimum: 4
    assert_select '#main .entry', 3
    assert_select 'h3', 'Book1'
    assert_select '.price', /\$[,\d]+\.\d\d/
    get :index
    assert_response :success
  end

end
