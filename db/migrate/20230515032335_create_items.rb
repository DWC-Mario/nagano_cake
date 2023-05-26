class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
       t.string :item_name, null: false
      t.text :item_explanation, null: false
      t.integer :genre_id, null: false
      t.integer :price, null: false
      t.boolean :is_active, null: false

      t.timestamps
    end
  end
end
