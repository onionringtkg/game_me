# frozen_string_literal: true

filename = "menu_item.jpg"
path = Rails.root.join(__dir__, filename)

Shop.all.each do |shop|
  1.upto(9) do |i|
    shop.menu_items.create(
      picture: open(path),
      name: "メニュー#{i}",
      price: 800 + i * 20
    )
  end
end
