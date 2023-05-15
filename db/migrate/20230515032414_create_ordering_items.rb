class CreateOrderingItems < ActiveRecord::Migration[6.1]
  def change
    create_table :ordering_items do |t|
      t.integer :order_id, null: false
      t.integer :item_id, null: false
      t.integer :count, null: false
      t.integer :tax_inculuded_price, null: false
      t.integer :production_status, null: false, default: 0

      t.timestamps
    end
  end
end
