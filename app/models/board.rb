class Board < ApplicationRecord
  validates :name, uniqueness: true, presence: true
  has_many :lists, dependent: :destroy
end
