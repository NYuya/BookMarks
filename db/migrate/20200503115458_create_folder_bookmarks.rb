class CreateFolderBookmarks < ActiveRecord::Migration[5.2]
  def change
    create_table :folder_bookmarks do |t|
      t.integer :bookmark_id
      t.integer :folder_id

      t.timestamps
    end
  end
end
