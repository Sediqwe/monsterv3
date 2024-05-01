class User < ApplicationRecord
  before_validation :normalize_username
  before_validation :normalize_email
  has_one_attached :userimage , dependent: :delete_all
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
  def should_generate_new_friendly_id?
    username_changed?
  end
  def self.ransackable_attributes(auth_object = nil)
      [ "username", "slug"]
  end
  def self.ransackable_associations(auth_object = nil)
      [ "username", "slug"]
  end
         
end
