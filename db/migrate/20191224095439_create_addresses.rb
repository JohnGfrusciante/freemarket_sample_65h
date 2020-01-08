class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :name_family,                   null: false
      t.string :name_first,                   null: false
      t.string :kana_family,              null: false
      t.string :kana_first,              null: false
      t.string :postal_code,            null: false
      t.integer :prefecture,             null: false
      t.string :municipality,            null: false
      t.string :house_number,            null: false
      t.string :building
      t.string :tel
      t.references :user,             null: false, foreign_key: true
      t.timestamps
    end
  end
end
