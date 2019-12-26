class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.integer :postal_code,            null: false
      t.integer :prefecture,             null: false
      t.string :municipality,            null: false
      t.string :house_number,            null: false
      t.string :building
      t.references :user,             null: false, foreign_key: true
      t.timestamps
    end
  end
end
