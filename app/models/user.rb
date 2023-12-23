# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  role                   :integer          default(0), not null
#  roles                  :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#


class User < ApplicationRecord
  # Handles user roles and permissions using Petergate.
  #
  # @!macro [new] user_roles
  #   @note Users can only have one role due to `multiple: false` setting.
  #
  # @!method petergate
  #   @!scope class
  #   @param roles [Array<Symbol>] The roles granted to the user.
  #   @option roles [Symbol] :site_admin The site administrator role.
  #   @param multiple [Boolean] (false) Whether a user can have multiple roles.
  #   @return [void]
  petergate(roles: [:site_admin], multiple: false)

  # Devise modules for user authentication and related features.
  #
  # @!method devise
  #   @!scope class
  #   @param *modules [Array<Symbol>] Devise modules to include.
  #   @return [void]
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Validations for the User model.
  #
  # @!method validates_email
  #   @!scope class
  #   @param email [String] The user's email address.
  #   @option options [Boolean] :case_sensitive (false) Perform case-sensitive email confirmation.
  #   @return [void]
  validates :email, confirmation: { case_sensitive: false }, format: URI::MailTo::EMAIL_REGEXP
  validates :roles, presence: true
end
