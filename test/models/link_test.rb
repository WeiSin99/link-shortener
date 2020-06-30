require 'test_helper'

class LinkTest < ActiveSupport::TestCase
  
  def setup 
  	@link = Link.new(original_link: "www.google.com", shortened_link: "www.youtube.com")
  end

  test "should be valid" do 
  	assert @link.valid?
  end

  test "link validation should accept valid links" do 
  	valid_links = %w[https://www.google.com www.YOUTUBE.com instaGram.com http://www.yahoo.com]
  	valid_links.each do |valid_link|
  		@link.original_link = valid_link
  		assert @link.valid?, "#{valid_link.inspect} should be valid"
  	end
  end

  test "link validation should reject invalid link" do 
  	invalid_links = %w[ht://ww.goo htt://www.google.com https://www.google https://www.google.c]
  	invalid_links.each do |invalid_link|
  		@link.original_link = invalid_link
  		assert_not @link.valid?, "#{invalid_link.inspect} should be invalid"
  	end
  end

  test "shortened_link should be unique" do 
  	duplicate_shortend_link = @link.dup
  	@link.save
  	assert_not duplicate_shortend_link.valid?
  end

end
