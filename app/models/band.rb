class Band < ApplicationRecord
  validates :name, :year, presence: true
end
