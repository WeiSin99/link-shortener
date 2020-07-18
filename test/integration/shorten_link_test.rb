require 'test_helper'

class ShortenLinkTest < ActionDispatch::IntegrationTest

  def setup
    @link = links(:google)
  end

  test "invalid link" do
    get root_path
    assert_no_difference 'Link.count' do
      post links_path, params: { link: { original_link: "ww.google"} }
    end
    follow_redirect!
    assert_template 'links/new'
  end

end
