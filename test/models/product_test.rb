# == Schema Information
#
# Table name: products
#
#  id         :integer          not null, primary key
#  dates      :date
#  desc       :text
#  name       :string
#  price      :decimal(5, 2)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "test_helper"

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
