class CreateStreetAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :street_addresses do |t|
      t.string :postal_code
      t.integer :prefecture_id
      t.string :municipality
      t.string :address
      t.string :building
      t.string :phone_number
      t.integer :purchase_record_id, foreign_key: true
      t.timestamps
    end
  end
end
