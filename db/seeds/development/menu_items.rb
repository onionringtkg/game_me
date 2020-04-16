# frozen_string_literal: true

1.upto(9) do |i|
  shop = Shop.find(i)
  1.upto(9) do |j|
    shop.menu_items.create(
      name: "メニュー#{j}",
      price: 800 + j * 20
    )
  end
end
