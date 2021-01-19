require "rails_helper"
require "spec_helper"

describe Link do
  context "validation" do
    before(:all) do
      @link = Link.new(original_link: "https://www.google.com", identifier: "sd89uY")
    end

    it "should accept valid links" do
      valid_links = %w[https://www.google.com http://www.yahoo.com https://www.google.com]
      valid_links.each do |valid_link|
        @link.original_link = valid_link
        expect(@link.valid?).to be true
      end
    end

    it "should reject invalid link" do
      invalid_links = %w[google google.com ww.google.com]
      invalid_links.each do |invalid_link|
        @link.original_link = invalid_link
        expect(@link.valid?).to be false
      end
    end

    it "should be unique" do
      duplicate_shortend_link = @link.dup
      @link.save
      @link.update(original_link: "https://www.youtube.com", identifier: "sd89uY")
      expect(duplicate_shortend_link.valid?).to be false
    end

  end
end
