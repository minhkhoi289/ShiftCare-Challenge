class Client < ApplicationRecord
  scope :search_by_name, ->(name) { where("full_name ILIKE ?", "%#{name}%") }
end
