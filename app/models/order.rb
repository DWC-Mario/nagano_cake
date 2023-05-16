class Order < ApplicationRecord
  
  enum how_to_pay: { 
    transfer: 0, 
    credit_card: 1 
  }
  
  enum order_status: {
    payment_waiting: 0,
    paid_up: 1,
    in_production: 2,
    preparing: 3,
    shipped: 4
  }
  
  belongs_to :address
  belongs_to :customer
  has_many :ordering_items
  
end
