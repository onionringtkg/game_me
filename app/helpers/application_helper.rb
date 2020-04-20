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

  def count_current_carts_items
    current_carts&.inject(0) { |result, cart| result + cart.count_items } || 0
  end

  def total_number(items)
    items.inject(0) { |result, item| result + item.number }
  end

  def total_amount(obj)
    items = if obj.is_a? Cart
              obj.cart_items
            elsif obj.is_a? Order
              obj.ordered_items
            end
    delivery_fee = obj.shop.delivery_fee
    items.inject(delivery_fee) { |result, item| result + subtotal(item) }
  end

  def subtotal(item)
    item.price * item.number
  end
end
