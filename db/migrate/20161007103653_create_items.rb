class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.integer :category_id
      t.integer :brand_id
      t.string :sku
      t.string :name
      t.string :serial
      t.date :purchased_at
      t.string :warranty_period
      t.integer :person_id
      t.integer :user_id

      t.timestamps
    end
    add_index :items, :sku, unique: true
    add_index :items, :serial, unique: true
  end
end
