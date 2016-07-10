class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :phone_numbers
  has_many :submissions

  def admin?
    type == "Admin"
  end
end
