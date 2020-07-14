class CreateLinks < ActiveRecord::Migration[6.0]
  def change
    create_table :links do |t|
      t.text :original_link
      t.string :shortened_link

      t.timestamps
    end
  end
end
