class Board < ApplicationRecord
  validates :name, uniqueness: true, presence: true
  has_many :lists
end
