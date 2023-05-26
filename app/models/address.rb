class Address < ApplicationRecord

  belongs_to :customer

  validates :post_code,     format: { with: /\A\d{7}\z/ }
  validates :address,       presence: true
  validates :address_name,  format: { with: /\A[ぁ-んァ-ン一-龥a-zA-Z]+\z/ }

  def address_display
    '〒'+ post_code.insert(3, "-") + '　' + address + '　' + address_name
  end

end
