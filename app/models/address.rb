class Address < ApplicationRecord
  
  belongs_to :customer
  
  validates :post_code, numericality: { only_integer: true}
  validates :address, presence: true
  validates :address_name, presence: true
  
end
