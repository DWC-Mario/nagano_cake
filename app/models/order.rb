class Order < ApplicationRecord

  enum how_to_pay:   { "銀行振込": 0, "クレジットカード": 1 }
  enum order_status: { "入金待ち": 0, "入金確認": 1, "製造中": 2, "発送準備中": 3, "発送済み": 4 }

end
