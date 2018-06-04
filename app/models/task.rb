class Task < ApplicationRecord
  validates :name, uniqueness: true, presence: true
  belongs_to :list

  def self.by_priority
    order(priority: :asc)
  end
end
