class Link < ApplicationRecord
	VALID_URL_REGEX = /\A(?:(?:http|https):\/\/)?([-a-zA-Z0-9.]{2,256}\.[a-z]{2,4})\b(?:\/[-a-zA-Z0-9@,!:%_\+.~#?&\/\/=]*)?\z/
  default_scope -> { order(created_at: :desc) }
	validates :original_link, presence: true, format: { with: VALID_URL_REGEX }
	validates :shortened_link, uniqueness: true
  before_create :generate_unique_short_url, :sanitize_url

  def generate_unique_short_url
    short_link = generate_short_url
    while !Link.find_by(shortened_link: short_link).nil? do
      short_link = generate_short_url
    end
    self.shortened_link = short_link
  end

  def generate_short_url
    chars_letter = ['A'..'Z','a'..'z'].map {|range| range.to_a}.flatten
    chars = ['0'..'9','A'..'Z','a'..'z'].map{|range| range.to_a}.flatten
    first_two_short_link = chars_letter.sample
    second_letter = chars_letter.sample
    while first_two_short_link == second_letter do
      second_letter = chars_letter.sample
    end
    first_two_short_link = first_two_short_link + second_letter
    latter_four_short_link = 4.times.map{chars.sample}.join
    short_link = first_two_short_link + latter_four_short_link
  end

  def sanitize_url
    stripped_url = original_link.strip
    sanitize_link = stripped_url.downcase.gsub(/(https?:\/\/)|(www\.)/,"")
    self.original_link = "https://www.#{sanitize_link}"
  end

end
