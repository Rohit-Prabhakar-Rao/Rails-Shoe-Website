class ApplicationController < ActionController::Base
    private
    def current_cart
        Cart.find(session[:cart_id])
        rescue ActiveRecord::RecordNotFound
        cart = Cart.create
        session[:cart_id] = cart.id
        cart
    end

    before_action :set_line_items

    private
  
    def set_line_items
      @line_items = LineItem.all
    end
end
