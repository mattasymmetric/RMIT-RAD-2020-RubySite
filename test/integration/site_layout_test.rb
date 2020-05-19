require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest

  test "site navigation links" do
    get home_path
    assert_select "a[href=?]", home_path, count: 2
    assert_select "a[href=?]", about_path
  end
  
end
