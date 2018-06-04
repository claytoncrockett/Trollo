require 'rails_helper'

RSpec.describe Task, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
  end

  describe 'methods' do
    context 'class' do
      before(:each) do
        @board = Board.create(name: 'Big Board')
        @list = List.create(name: 'important list', priority: 1, board_id: @board.id)
        @task1 = Task.create(name: 'Ztask', priority: 4, completed: true, list_id: @list.id )
        @task2 = Task.create(name: 'Ltask', priority: 2, completed: true, list_id: @list.id )
        @task3 = Task.create(name: 'Atask', priority: 1, completed: false, list_id: @list.id )
        @task4 = Task.create(name: 'Btask', priority: 3, completed: false, list_id: @list.id )
      end


      it 'orders by priority desc' do
        @tasks = Task.by_priority


        expect(@tasks).to eq([@task3, @task2, @task4, @task1])
      end
    end
  end

end
