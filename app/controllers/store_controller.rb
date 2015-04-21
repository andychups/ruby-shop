class StoreController < ApplicationController
  include Counter

  def index
    increment

    @products = Product.order(:title)
    @page_title = 'Каталог'
    @counter = get_counter_value
  end
end
