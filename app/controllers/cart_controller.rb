# class CartController < ApplicationController
#   access all: [:index], user: {except: [:destroy, :new, :create, :update, :edit]}, site_admin: :all
#   def show
#     @render_cart = false
#   end
#
#   def add
#     @product = Product.find_by(id: params[:id])
#     quantity = params[:quantity].to_i
#     current_orderable = @cart.orderables.find_by(product_id: @product.id)
#     if current_orderable && quantity > 0
#       current_orderable.update(quantity:)
#     elsif quantity <= 0
#       current_orderable.destroy
#     else
#       @cart.orderables.create(product: @product, quantity:)
#     end
#
#     respond_to do |format|
#       format.html { redirect_to products_path, notice: "Product was successfully created." }
#       format.js
#     end
#
#     # format.turbo_stream do
#     #   render turbo_stream: [turbo_stream.replace('cart',
#     #                                              partial: 'cart/cart',
#     #                                              locals: { cart: @cart }),
#     #                         turbo_stream.replace(@product)]
#   end
#
#
#   def remove
#     Orderable.find_by(id: params[:id]).destroy
#   end
# end


# Controller for managing the shopping cart.
class CartController < ApplicationController
  # Sets up access control for actions in the controller.
  # - :index action is accessible by all.
  # - Other actions have specific access restrictions for different user roles.
  # == Example
  #
  #   # Allow all users to access the :index action.
  #   access all: [:index],
  #          user: { except: [:destroy, :new, :create, :update, :edit] },
  #          site_admin: :all
  #
  # == Note
  # Ensure that the `access` gem is correctly configured.
  # See https://github.com/chaps-io/access
  access all: [:index], user: {except: [:destroy, :new, :create, :update, :edit]}, site_admin: :all

  # Displays the contents of the shopping cart.
  def show
    @render_cart = false
  end

  # Adds a product to the shopping cart.
  # If the product is already in the cart, updates the quantity.
  # If quantity is 0 or less, removes the product from the cart.
  def add
    @product = Product.find_by(id: params[:id])
    quantity = params[:quantity].to_i
    current_orderable = @cart.orderables.find_by(product_id: @product.id)

    if current_orderable && quantity > 0
      current_orderable.update(quantity: quantity)
    elsif quantity <= 0
      current_orderable&.destroy
    else
      @cart.orderables.create(product: @product, quantity: quantity)
    end

    respond_to do |format|
      format.html { redirect_to products_path, notice: "Product was successfully created." }
      format.js
    end

    # Uncomment the following block if using Turbo Streams.
    # format.turbo_stream do
    #   render turbo_stream: [
    #     turbo_stream.replace('cart', partial: 'cart/cart', locals: { cart: @cart }),
    #     turbo_stream.replace(@product)
    #   ]
    # end
  end

  # Removes a product from the shopping cart.
  def remove
    Orderable.find_by(id: params[:id])&.destroy
  end
end


#documentation tags added
#
# class CartController < ApplicationController
#   # Specify access control rules for different user roles.
#   #
#   # @!macro [new] access_tags
#   #   @option access [Array<Symbol>] :all All users have access to specified actions.
#   #   @option access [Hash] :user Specify access rules for users.
#   #   @option user [Array<Symbol>] :except Actions to exclude for users.
#   #   @option access [Symbol] :site_admin All actions allowed for site administrators.
#   access all: [:index], user: { except: [:destroy, :new, :create, :update, :edit] }, site_admin: :all
#
#   # Displays the contents of the shopping cart.
#   #
#   # @return [void]
#   def show
#     @render_cart = false
#   end
#
#   # Adds a product to the shopping cart.
#   #
#   # @param id [Integer] The ID of the product to add.
#   # @param quantity [Integer] The quantity of the product to add.
#   #
#   # @return [void]
#   def add
#     @product = Product.find_by(id: params[:id])
#     quantity = params[:quantity].to_i
#     current_orderable = @cart.orderables.find_by(product_id: @product.id)
#
#     if current_orderable && quantity > 0
#       current_orderable.update(quantity: quantity)
#     elsif quantity <= 0
#       current_orderable&.destroy
#     else
#       @cart.orderables.create(product: @product, quantity: quantity)
#     end
#
#     respond_to do |format|
#       format.html { redirect_to products_path, notice: "Product was successfully created." }
#       format.js
#     end
#   end
#
#   # Removes a product from the shopping cart.
#   #
#   # @param id [Integer] The ID of the Orderable to remove.
#   #
#   # @return [void]
#   def remove
#     Orderable.find_by(id: params[:id])&.destroy
#   end
# end
#

