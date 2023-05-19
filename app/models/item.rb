class Item < ApplicationRecord

  has_one_attached :item_image
  belongs_to :genre
  has_many :cart_items
  has_many :ordering_items

 def get_image(width, height)

  unless item_image.attached?

   file_path = Rails.root.join('app/assets/images/no_image.jpg')

   item_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')

  end

  item_image.variant(resize_to_limit: [width, height]).processed

 end
 validates :price, presence: true

   enum sales_status: { on_sale: 0, draft: 1 }
end
