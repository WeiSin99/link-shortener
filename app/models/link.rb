class Link < ApplicationRecord
	VALID_URL_REGEX = /\A(?:(?:http|https):\/\/)?([-a-zA-Z0-9.]{2,256}\.[a-z]{2,4})\b(?:\/[-a-zA-Z0-9@,!:%_\+.~#?&\/\/=]*)?\z/
	validates :original_link, presence: true, format: { with: VALID_URL_REGEX }
	validates :shortened_link, uniqueness: true
end
