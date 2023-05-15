class OrderingItem < ApplicationRecord
  enum production_status: {cannot_status: 0, production_wait: 1, production_now: 2, production_complete:3 }
end
