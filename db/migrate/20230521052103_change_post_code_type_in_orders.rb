class ChangePostCodeTypeInOrders < ActiveRecord::Migration[6.1]
  def change
    change_column :orders, :post_code, :string
  end
end
