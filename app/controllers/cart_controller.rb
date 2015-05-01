class CartController < ApplicationController

  # GET /cart
  def index
    @cart = Cart.find(session[:cart_id])
    @total_price = 0

    @cart.line_items.each do |item|
      @total_price += item.quantity * item.product.price
    end
  end
end
