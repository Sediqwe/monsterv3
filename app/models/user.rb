class User < ApplicationRecord
  before_validation :normalize_username
  before_validation :normalize_email
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  private

  def normalize_username
    self.username = username.strip.downcase unless username.nil?
  end
  def normalize_email
    self.email = email.strip.downcase unless email.nil?
  end
         
end
