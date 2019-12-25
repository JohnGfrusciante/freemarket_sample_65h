class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name,                           null: false
      t.text :discription
      t.integer :price,                         null: false 
      t.integer :condition,                     null: false
      t.integer :shipping_charge,               null: false
      t.integer :shipping_date,                 null: false
      t.integer :prefecture,                    null: false
      t.integer :transaction_status,            null: false
      t.integer :category_id,                   null: false
      t.references :seller,                  null: false, foreign_key: { to_table: :users }
      t.references :buyer,                   foreign_key: { to_table: :users }
      t.timestamps
    end
  end
end
