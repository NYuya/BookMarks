class CreateRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :relationships do |t|
      t.references :customer, foreign_key: true
      t.references :follow, foreign_key: { to_table: :customers }

      t.timestamps

      t.index [:customer_id, :follow_id], unique: true
    end
  end
end