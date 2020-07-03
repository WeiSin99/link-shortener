class Link < ApplicationRecord
	VALID_URL_REGEX = /\A(?:(?:http|https):\/\/)?([-a-zA-Z0-9.]{2,256}\.[a-z]{2,4})\b(?:\/[-a-zA-Z0-9@,!:%_\+.~#?&\/\/=]*)?\z/
  default_scope -> { order(created_at: :desc) }
	validates :original_link, presence: true, format: { with: VALID_URL_REGEX }
	validates :shortened_link, uniqueness: true
  before_create :generate_short_url, :sanitize_url

  def generate_short_url
    chars = ['0'..'9','A'..'Z','a'..'z'].map{|range| range.to_a}.flatten
    short_link = 6.times.map{chars.sample}.join
    short_link = 6.times.map{chars.sample}.join while !Link.find_by(shortened_link: short_link).nil?
    self.shortened_link = short_link
  end

  def sanitize_url
    stripped_url = original_link.strip
    sanitize_link = stripped_url.downcase.gsub(/(https?:\/\/)|(www\.)/,"")
    self.original_link = "https://www.#{sanitize_link}"
  end

end