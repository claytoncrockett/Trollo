class List < ApplicationRecord
  validates :name, uniqueness: true, presence: true
  belongs_to :board
  has_many :tasks

  def self.by_priority(direction = :desc)
    order(priority: direction)
  end
end
