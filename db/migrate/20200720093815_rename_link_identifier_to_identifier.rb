class RenameLinkIdentifierToIdentifier < ActiveRecord::Migration[6.0]
  def change
    rename_column :links, :link_identifier, :identifier
  end
end
