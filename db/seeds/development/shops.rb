# frozen_string_literal: true

filename = "shop.jpg"
path = Rails.root.join(__dir__, filename)

1.upto(9) do |i|
  Shop.create!(
    picture: open(path),
    name: "SHOP#{i}",
    address: "東京都新宿区西新宿１丁目１−１",
    phone_number: "09012345678",
    delivery_fee: 400
  )
end
