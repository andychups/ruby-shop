class CartController < ApplicationController

  # GET /cart
  def index
    @cart = (session[:cart_id]) ? Cart.find(session[:cart_id]) : nil
    @total_price = @cart ? @cart.total_price : nil
  end
end
