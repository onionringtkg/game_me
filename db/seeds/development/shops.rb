# frozen_string_literal: true

1.upto(9) do |i|
  Shop.create!(
    name: "SHOP#{i}",
    address: "東京都新宿区西新宿１丁目１−１",
    phone_number: "09012345678",
    delivery_fee: 400
  )
end
