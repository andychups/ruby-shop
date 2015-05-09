class CartController < ApplicationController

  # GET /cart
  def index
    @cart = (session[:cart_id]) ? Cart.find(session[:cart_id]) : nil
    @total_price = 0

    if (@cart)
      @cart.line_items.each do |item|
        @total_price += item.quantity * item.product.price
      end
    end
  end
end
