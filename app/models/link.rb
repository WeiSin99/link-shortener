class Link < ApplicationRecord
	VALID_URL_REGEX = /\A(?:(?:http|https):\/\/)?([-a-zA-Z0-9.]{2,256}\.[a-z]{2,4})\b(?:\/[-a-zA-Z0-9@,!:%_\+.~#?&\/\/=]*)?\z/
	validates :original_link, presence: true, format: { with: VALID_URL_REGEX }
	validates :shortened_link, uniqueness: true
  before_create :generate_short_url

  def generate_short_url
    chars = ['0'..'9','A'..'Z','a'..'z'].map{|range| range.to_a}.flatten
    short_link = 6.times.map{chars.sample}.join
    short_link = 6.times.map{chars.sample}.join while !Link.find_by(shortened_link: short_link).nil?
    self.shortened_link = short_link
  end

end
