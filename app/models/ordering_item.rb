class OrderingItem < ApplicationRecord
  enum production_status: {cannot_status: 0, production_wait: 1, production_now: 2, production_complete:3 }

  belongs_to :item
  belongs_to :order

  def subtotal
    tax_included_price * count
  end

  def tax_inculuded_price
    (price * 1.1).floor
  end

end
