require 'test_helper'

class ShortenLinkTest < ActionDispatch::IntegrationTest

  test "invalid link" do
    get root_path
    assert_no_difference 'Link.count' do
      post links_path, params: { link: { original_link: "htt://ww.go"} }
    end
    follow_redirect!
    assert_template 'links/new'
  end

end
