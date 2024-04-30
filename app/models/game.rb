class Game < ApplicationRecord
    def self.ransackable_attributes(auth_object = nil)
        ["active", "created_at", "hidden", "id", "id_value", "name", "reserved", "reservedtime", "updated_at"]
      end
end
