# frozen_string_literal: true

class CartItemsController < ApplicationController
  def create; end

  def destroy
    CartItem.find(params[:id]).destroy
    redirect_back(fallback_location: :carts)
  end

  def pay
    /決済する際に、どうやって決済情報持ってくる？？
      候補①　idで全商品検索する
      候補②　cartIDとかで一撃で全部検索してくる？？
    /
    @item = CartItem.find(params[:id])
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    charge = Payjp::Charge.create(
    amount: @item.price,
    card: params['payjp-token'],
    currency: 'jpy'
    )
    /response取得して、DBに保存/
  end
end
