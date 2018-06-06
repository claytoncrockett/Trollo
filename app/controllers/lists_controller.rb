class ListsController < ApplicationController
  before_action :set_board
  before_action :set_list, only: [:show, :edit, :update, :destroy, :up, :down]

  def index
    @lists = @board.lists.order('priority desc')
  end

  def up
    lists = @list.move_up(@list)
    # binding.pry
    lists.each do |list|
      list.update(priority: "#{list.priority}")
    end
    redirect_to @board
  end

  def down
    lists = @list.move_down(@list)
    # binding.pry
    lists.each do |list|
      list.update(priority: "#{list.priority}")
    end
    redirect_to @board
  end

  def show
  end

  def new
    @list = @board.lists.new
    render :new
  end

  def edit
    render :edit
  end

  def create
    @list = @board.lists.new(list_params)
    if @list.save
      @list.priority = @list.id
      @list.save
      redirect_to @board
    else
      render :new
    end
  end

  def update
    if @list.update(list_params)
      redirect_to [@board, @list]
    else
      render :edit
    end
  end

  def destroy
    @list.destroy
    redirect_to board_path(@board)
  end

  private
    def set_board
      @board = Board.find(params[:board_id])
    end

    def set_list
      @list = List.find(params[:id])
    end

    def list_params
      params.require(:list).permit(:name, :priority)
    end
end
