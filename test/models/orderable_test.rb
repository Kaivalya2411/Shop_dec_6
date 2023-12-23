# == Schema Information
#
# Table name: orderables
#
#  id         :integer          not null, primary key
#  quantity   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  cart_id    :integer          not null
#  product_id :integer          not null
#
# Indexes
#
#  index_orderables_on_cart_id     (cart_id)
#  index_orderables_on_product_id  (product_id)
#
# Foreign Keys
#
#  cart_id     (cart_id => carts.id)
#  product_id  (product_id => products.id)
#
require "test_helper"

class OrderableTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
