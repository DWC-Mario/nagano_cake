# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create(email:"fa@fa.com",password:"ffffff")
Customer.create(last_name:"山田",first_name:"太郎",last_name_kana:"ヤマダ",first_name_kana:"タロウ",post_code:"1234567",
                address:"長野県松本市",phone_number:"12345678900",is_active: true,email:"f@f.com",password:"123456")

Item.create(item_name: "シュークリーム" , item_explanation: "説明", genre_id: 1, price: 500, is_active: true)
Item.create(item_name: "シフォンケーキ" , item_explanation: "説明", genre_id: 2, price: 500, is_active: true)
Item.create(item_name: "マカロン" , item_explanation: "説明", genre_id: 2, price: 500, is_active: true)
Item.create(item_name: "キャンディ" , item_explanation: "説明", genre_id: 3, price: 500, is_active: true)


Order.create(customer_id: 1,post_code:"1234567", address: "長野県松本市",address_name:"山田",postage: 800,total_price: 1300,how_to_pay: 0,order_status: 0)

OrderingItem.create(order_id: 1, item_id: 1, count: 1, tax_included_price: 550, production_status: 0)

Genre.create(genre_name:"焼き菓子")

Address.create(customer_id: 1, post_code: "1234567", address: "長野県松本市", address_name: "山田")

CartItem.create(item_id: 1,customer_id: 1,count: 1)
