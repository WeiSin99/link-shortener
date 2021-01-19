class Link < ApplicationRecord
  validates :original_link, presence: true, format: { with: URI.regexp }
  before_create :sanitize_url
  after_create :generate_identifier

  def generate_identifier
    hash_function = Hashids.new("link identifier salt", 6)
    digest = hash_function.encode(self.id)
    self.identifier = digest
    self.save
  end

  def sanitize_url
    stripped_url = original_link.strip
    sanitize_link = stripped_url.downcase.gsub(/(https?:\/\/)|(www\.)/,"")
    self.original_link = "https://www.#{sanitize_link}"
  end
end
