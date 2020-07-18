require 'test_helper'

class LinkTest < ActiveSupport::TestCase

  def setup
  	@link = Link.new(original_link: "https://www.google.com", link_identifier: "www.youtube.com")
  end

  test "should be valid" do
  	assert @link.valid?
  end

  test "link validation should accept valid links" do
  	valid_links = %w[https://www.google.com http://www.yahoo.com https://www.google.com]
  	valid_links.each do |valid_link|
  		@link.original_link = valid_link
  		assert @link.valid?, "#{valid_link.inspect} should be valid"
  	end
  end

  test "link validation should reject invalid link" do
  	invalid_links = %w[google google.com ww.google.com]
  	invalid_links.each do |invalid_link|
  		@link.original_link = invalid_link
  		assert_not @link.valid?, "#{invalid_link.inspect} should be invalid"
  	end
  end

  test "link identifier should be unique" do
  	duplicate_shortend_link = @link.dup
  	@link.save
    @link.update(original_link: "https://www.youtube.com", link_identifier: "www.youtube.com")
  	assert_not duplicate_shortend_link.valid?
  end

end
