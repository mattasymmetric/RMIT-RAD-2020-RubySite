require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  # [1, pg. 150-151]
  def setup 
    @base_title = "News Plus"
  end

  test "should get home" do
    get home_path
    assert_response :success
    assert_select "title", "Home | #{@base_title}"
  end

  test "should get about" do
    get about_path
    assert_response :success
    assert_select "title", "About | #{@base_title}"
  end

end
