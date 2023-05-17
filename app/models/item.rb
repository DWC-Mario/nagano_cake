class Item < ApplicationRecord
  
  has_one_attached :item_image
  belongs_to :genre
  has_many :cart_items
  has_many :ordering_items
  
  def tax_inculuded_price
    (price * 1.1).floor
  end
  
end
