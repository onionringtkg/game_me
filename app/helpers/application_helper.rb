module ApplicationHelper
  def page_title
    title = if @shop.present?
              @shop.name
            else
              "MyApp"
            end
    if @title.present?
      title + " | " + @title
    else
      title
    end
  end

  def reception_time(shop)
    if shop.restrict_reception_time
      format("%<start_hour>d:%<start_min>02d〜%<end_hour>d:%<end_min>02d",
             start_hour: shop.reception_start_time_hour,
             start_min: shop.reception_start_time_min,
             end_hour: shop.reception_end_time_hour,
             end_min: shop.reception_end_time_min)
    else
      "24時間"
    end
  end

  def current_carts_items_count
    current_carts&.map(&:count_items)&.sum || 0
  end

  def total_amount(cart)
    cart.cart_items.map { |item| item.price * item.number }.sum +
      cart.shop.delivery_fee
  end

  def subtotal(item)
    item.price * item.number
  end
end
