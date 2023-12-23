Rails.configuration.stripe = {
  :publishable_key => ENV['PUBLISHABLE_KEY'],
  :secret_key      => ENV['SECRET_KEY']
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]

# config/initializers/stripe.rb

# Stripe.api_key = Rails.application.credentials.stripe[:secret_key]


# docs tags added code
# # Configuration class for managing Stripe settings.
# class StripeConfiguration
#   # Public: Configuration for the Stripe API.
#   #
#   # @!attribute [rw] publishable_key
#   #   @return [String] the publishable key for the Stripe API.
#   # @!attribute [rw] secret_key
#   #   @return [String] the secret key for the Stripe API.
#   class << self
#     # Public: Set up the Stripe configuration.
#     #
#     # @param options [Hash] Configuration options for Stripe.
#     # @option options [String] :publishable_key The publishable key.
#     # @option options [String] :secret_key The secret key.
#     # @return [void]
#     def setup(options = {})
#       Rails.configuration.stripe = {
#         publishable_key: options[:publishable_key] || ENV['PUBLISHABLE_KEY'],
#         secret_key: options[:secret_key] || ENV['SECRET_KEY']
#       }
#
#       Stripe.api_key = Rails.configuration.stripe[:secret_key]
#     end
#   end
# end