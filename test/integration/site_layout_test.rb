require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest

  test "site navigation links" do
    get home_path
    assert_select "a[href=?]", home_path, count: 2
  end
  
end
