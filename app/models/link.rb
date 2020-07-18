class Link < ApplicationRecord
	validates :original_link, presence: true, format: { with: URI.regexp }
	validates :link_identifier, uniqueness: true
  before_create :generate_unique_short_url, :sanitize_url

  def generate_unique_short_url
    link_identifier = generate_link_identifier
    while Link.find_by(link_identifier: link_identifier).present? do
      link_identifier = generate_link_identifier
    end
    self.link_identifier = link_identifier
  end

  def generate_link_identifier
    chars = ['A'..'Z','a'..'z'].map {|range| range.to_a}.flatten
		first_two_chars = 2.times.map{chars.sample}.join
		latter_four_chars = SecureRandom.alphanumeric(4)
		first_two_chars + latter_four_chars
  end

  def sanitize_url
    stripped_url = original_link.strip
    sanitize_link = stripped_url.downcase.gsub(/(https?:\/\/)|(www\.)/,"")
    self.original_link = "https://www.#{sanitize_link}"
  end

end
