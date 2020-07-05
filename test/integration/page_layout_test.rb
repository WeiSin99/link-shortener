require 'test_helper'

class PageLayoutTest < ActionDispatch::IntegrationTest

  def setup
    @google_link = links(:google)
    @youtube_link = links(:youtube)
  end

  test "page layout" do
    get root_path
    assert_template 'links/new'
    assert_select "a[href=?]", root_path
    all_links = Link.all
    all_links.each do |link|
      assert_select 'p', text: link.original_link
      assert_select 'span', text: root_url + link.shortened_link
    end
    assert_difference 'Link.count', -1 do
      delete link_path(@youtube_link)
    end
  end

end
