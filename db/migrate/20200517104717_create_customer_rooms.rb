class CreateCustomerRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :customer_rooms do |t|
      t.integer :customer_id
      t.integer :room_id

      t.timestamps
    end
  end
end
