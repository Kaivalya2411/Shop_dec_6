class ApplicationController < ActionController::Base
  before_action :set_render_cart
  before_action :initialize_cart
  # layout :set_layout

  def set_render_cart
    @render_cart = true
  end

  def initialize_cart
    @cart ||= Cart.find_by(id: session[:cart_id])

    if @cart.nil?
      @cart = Cart.create
      session[:cart_id] = @cart.id
    end
  end

  # private
  # def set_layout
  #   if current_user&.admin?
  #     "admin"
  #   elsif current_user&.guest?
  #     "nothing"
  #   else
  #     "application"
  #   end
  # end
end
