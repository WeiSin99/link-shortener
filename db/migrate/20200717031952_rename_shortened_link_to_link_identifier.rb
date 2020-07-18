class RenameShortenedLinkToLinkIdentifier < ActiveRecord::Migration[6.0]
  def change
    rename_column :links, :shortened_link, :link_identifier
  end
end
