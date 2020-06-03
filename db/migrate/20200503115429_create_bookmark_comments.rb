class CreateBookmarkComments < ActiveRecord::Migration[5.2]
  def change
    create_table :bookmark_comments do |t|
      t.integer :bookmark_id
      t.integer :customer_id
      t.text :bookmark_comment
      t.integer :score

      t.timestamps
    end
  end
end
