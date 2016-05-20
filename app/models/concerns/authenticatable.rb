module Authenticatable
  extend ActiveSupport::Concern

  included do
    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :trackable, :validatable

    def valid_password?(incoming_password)
      if Rails.env.development? || Rails.env.test? || Rails.env.qa?
        incoming_password == (ENV['DEFAULT_PASSWORD'].presence || 'swordfish')
      else
        super
      end
    end
  end
end
