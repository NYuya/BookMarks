class CreateFolders < ActiveRecord::Migration[5.2]
  def change
    create_table :folders do |t|
      t.integer :customer_id
      t.integer :bookmark_id
      t.string :folder_name
      t.integer :pearent_folder_id

      t.timestamps
    end
  end
end
