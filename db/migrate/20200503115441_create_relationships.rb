class CreateRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :relationships do |t|
      t.integer :customer_id
      t.integer :follow_id

      t.timestamps
    end
  end
end
