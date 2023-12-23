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



class MyValidator < ActiveModel::Validator
  def validate(record)
    unless record.name.start_with? 'Pro_'
      record.errors.add :name, "Provide a name starting with 'Pro_' , please!"
    end
  end
end

# Docs Tags inserted code
# # Public: Custom validator for ensuring that the name starts with 'Pro_'.
# #
# # This validator is used to check the format of the name attribute in a record.
# #
# # @example
# #   class MyModel
# #     include ActiveModel::Validations
# #     validates_with MyValidator
# #   end
# class MyValidator < ActiveModel::Validator
#   # Public: Validate the format of the name attribute.
#   #
#   # @param record [Object] The record being validated.
#   #
#   # @return [void]
#   def validate(record)
#     unless record.name.start_with? 'Pro_'
#       record.errors.add :name, "Provide a name starting with 'Pro_' , please!"
#     end
#   end
# end

#
# class Product < ApplicationRecord
#   has_one_attached :file, dependent: :destroy do |attachable|
#     attachable.variant :thumb ,resize_to_limit: [100, 100]
#   end
#   has_one_attached :thumbnail, dependent: :destroy do |attachable|
#     attachable.variant :thumb ,resize_to_limit: [100, 100]
#   end
#
#   validates :dates, presence: true
#   validates_with MyValidator
#   validates :desc, length: { minimum: 15 }
#   validate :expiration_date_cannot_be_in_the_past
#   # , :discount_cannot_be_greater_than_total_value
#
#   def expiration_date_cannot_be_in_the_past
#     if dates.present? && dates < Date.today
#       errors.add(:dates, "can't be in the past")
#     end
#   end
#
#   # def discount_cannot_be_greater_than_total_value
#   #   if discount > total_value
#   #     errors.add(:discount, "can't be greater than total value")
#   #   end
#   # end
# end

# docs tags added code

# Public: Represents a product in the system.
#
# @!attribute [r] file
#   @return [ActiveStorage::Attached::One]
# @!attribute [r] thumbnail
#   @return [ActiveStorage::Attached::One]
class Product < ApplicationRecord
  # Public: Attach a file to the product.
  #
  # @param name [Symbol] The name of the attachment.
  # @param dependent [Symbol] The dependency of the attachment.
  # @yield [attachable] Optional block for defining variants.
  # @yieldparam attachable [ActiveStorage::Attached::One] The attachment instance.
  # @yieldreturn [void]
  #
  # @return [void]
  has_one_attached :file, dependent: :destroy do |attachable|
    attachable.variant :thumb, resize_to_limit: [100, 100]
  end

  # Public: Attach a thumbnail to the product.
  #
  # @param name [Symbol] The name of the attachment.
  # @param dependent [Symbol] The dependency of the attachment.
  # @yield [attachable] Optional block for defining variants.
  # @yieldparam attachable [ActiveStorage::Attached::One] The attachment instance.
  # @yieldreturn [void]
  #
  # @return [void]
  has_one_attached :thumbnail, dependent: :destroy do |attachable|
    attachable.variant :thumb, resize_to_limit: [100, 100]
  end

  # Public: Validate the presence of dates.
  #
  # @!attribute [rw] dates
  #   @return [Date] The dates attribute.
  validates :dates, presence: true

  # Public: Validate the length of the desc attribute.
  #
  # @!attribute [rw] desc
  #   @return [String] The desc attribute.
  #
  # @option options [Integer] :minimum (15) The minimum length required.
  validates :desc, length: { minimum: 15 }

  # Public: Custom validation method for checking the expiration date.
  #
  # @return [void]
  def expiration_date_cannot_be_in_the_past
    if dates.present? && dates < Date.today
      errors.add(:dates, "can't be in the past")
    end
  end
end