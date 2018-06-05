class List < ApplicationRecord
  validates :name, uniqueness: true, presence: true
  belongs_to :board 
  has_many :tasks, dependent: :destroy
  after_create :set_priority

  def self.by_priority(direction = :desc)
    order(priority: direction)
  end

  def set_priority
  end

  def move_up(list)
    @lists = List.order('priority desc')
    @lists.each_with_index{ |x,i| @index = i if list==x}
    @indexUp = @index + 1
    @oldPriority = @lists[@index].priority
    @lists[@index].priority = @lists[@indexUp].priority
    @lists[@indexUp].priority = @oldPriority
    @lists
    #return [@index, @indexUp, @lists[@index].priority, @lists[@indexUp].priority]
  end
end
