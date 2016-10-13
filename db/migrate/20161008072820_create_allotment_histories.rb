class CreateAllotmentHistories < ActiveRecord::Migration[5.0]
  def change
    create_table :allotment_histories do |t|
      t.integer :person_id
      t.integer :item_id
      t.integer :user_id
      t.boolean :is_allotted, default: :false

      t.timestamps
    end
  end
end
