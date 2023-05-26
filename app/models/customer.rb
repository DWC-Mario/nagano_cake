class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :cart_items
  has_many :addresses
  has_many :orders

  validates :last_name,       format: { with: /\A[ぁ-んァ-ン一-龥a-zA-Z]+\z/ }
  validates :first_name,      format: { with: /\A[ぁ-んァ-ン一-龥a-zA-Z]+\z/ }
  validates :last_name_kana,  format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :post_code,       format: { with: /\A\d{7}\z/ }
  validates :address,         presence: true
  validates :phone_number,    format: { with: /\A\d{10,11}\z/ }


  def full_address
    '〒'+ post_code.insert(3, "-") + ' ' + address
  end

  def full_name
    last_name + ' ' +  first_name
  end
  
  def full_name_kana
    last_name_kana + ' ' +  first_name_kana
  end

end
