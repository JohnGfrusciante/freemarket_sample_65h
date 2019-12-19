class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name,               null: false
      t.text :image
      t.text :discription
      t.integer :price,               null: false 
      t.references :condition_id,               null: false
      t.integer :shipping_charge,               null: false
      t.integer :shipping_date,               null: false
      t.references :prefectures_id,               null: false
      t.integer :transaction_status,               null: false
      t.integer :categorys_id,               null: false
      t.timestamps
    end
  end
end
