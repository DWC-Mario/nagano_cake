class Item < ApplicationRecord

  has_one_attached :item_image
  belongs_to :genre
  has_many :cart_items
  has_many :ordering_items


 validates_presence_of :item_name, :genre_id, :item_explanation, :price, :is_active

   enum sales_status: { on_sale: 0, draft: 1 }


  def tax_included_price
    (price * 1.1).floor
  end

  def get_image(width, height)
    unless item_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      item_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    item_image.variant(resize_to_fill: [width, height]).processed
  end

end
