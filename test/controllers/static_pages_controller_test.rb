require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  def setup 
    @title = "| News Plus"
  end

  test "should get home" do
    get home_path
    assert_response :success
    assert_select "title", "Home#{@title}"
  end

  test "should get about" do
    get about_path
    assert_response :success
    assert_select "title", "About#{@title}"
  end

end
