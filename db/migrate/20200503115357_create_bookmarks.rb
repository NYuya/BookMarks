class CreateBookmarks < ActiveRecord::Migration[5.2]
  def change
    create_table :bookmarks do |t|
      t.integer :customer_id
      t.string :bookmark_name
      t.text :bookmark_description
      t.integer :genre_id
      t.string :bookmark_image_id
      t.boolean :is_bookmark_status
      t.string :bookmark_screenshot_id

      t.timestamps
    end
  end
end
