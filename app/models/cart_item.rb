class CartItem < ApplicationRecord
  
  belongs_to :customer
  belongs_to :item
  
  def subtotal
    item.tax_inculuded_price * count
  end
  
end
