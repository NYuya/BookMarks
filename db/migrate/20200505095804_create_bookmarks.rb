class CreateBookmarks < ActiveRecord::Migration[5.2]
  def change
    create_table :bookmarks do |t|
      t.integer :customer_id
      t.string :bookmark_name
      t.string :bookmark_url
      t.text :bookmark_description
      t.integer :genre_id
      t.integer :folder_id
      t.string :bookmark_image_id
      t.boolean :is_bookmark_status, default: false, null: false
      t.string :bookmark_screenshot_id

      t.timestamps
    end
  end
end
