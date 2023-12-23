# == Schema Information
#
# Table name: carts
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#


# documentation tags added code
class Cart < ApplicationRecord
  has_many :orderables
  has_many :products, through: :orderables

  # Public: Calculate the total price of the items in the cart.
  #
  # Returns a Float representing the total price.
  #
  # @example
  #   cart = Cart.new
  #   # Assuming orderables are set up properly
  #   cart.total
  #
  # @return [Float] The total price of the items in the cart.
  def total
    orderables.to_a.sum { |orderable| orderable.total }
  end
end
