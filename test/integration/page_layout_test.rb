require 'test_helper'

class PageLayoutTest < ActionDispatch::IntegrationTest

  test "layout links" do
    get root_path
    assert_template 'links/new'
    assert_select "a[href=?]", root_path
  end

end
