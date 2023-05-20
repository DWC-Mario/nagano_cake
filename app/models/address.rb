class Address < ApplicationRecord

  belongs_to :customer


  validates :post_code,  length: { is: 7 }
  validates :address, presence: true
  validates :address_name, presence: true

  def address_display
    '〒'+ post_code + '' + address + '' + address_name
  end

end
