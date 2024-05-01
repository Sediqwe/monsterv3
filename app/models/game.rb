class Game < ApplicationRecord
  has_one_attached :gameimage , dependent: :delete_all
  extend FriendlyId
  friendly_id :name, use: :slugged
  has_many :gamelinks
  accepts_nested_attributes_for :gamelinks
  validates :name, uniqueness: true, presence: true, length: {minimum: 2, maximum:100}
  def should_generate_new_friendly_id?
    name_changed?
  end
  def self.ransackable_attributes(auth_object = nil)
      [ "name", "slug"]
  end
  def self.ransackable_associations(auth_object = nil)
      [ "name", "slug"]
  end

  def self.ransackable_attributes(auth_object = nil)
        ["active", "created_at", "hidden", "id", "id_value", "name", "reserved", "reservedtime", "updated_at"]
    end
    
end
