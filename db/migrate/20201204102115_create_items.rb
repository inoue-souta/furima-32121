class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references :user, foreign_key: true
      # t.integer :user_id, foreign_key: true
      # 外部キーを記述する際、integer型でもuserなどの外部キーにidをつけてあげれば記述出来る
      t.string :product
      t.text :explanation
      t.integer :category_id
      t.integer :status_id
      t.integer :burden_id
      t.integer :prefecture_id
      t.integer :day_id
      t.integer :price
      t.timestamps
    end
  end
end
