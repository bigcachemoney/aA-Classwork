class CreateArtworks < ActiveRecord::Migration[5.2]
  def change
    create_table :artworks do |t|
      t.string :title, null: false
      t.string :image_url, null: false
      t.integer :artist_id, null: false
    end

    # add_index :user_views, [:article_id, :user_id]
    add_index :artworks, [:artist_id, :title] #which comes first?

  end
end
