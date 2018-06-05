class TasksController < ApplicationController
before_action :set_list
before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = @list.tasks.order(:priority)
  end

  def up
  end

  def show
  end

  def new
    @task = @list.tasks.new
    render :new
  end

  def edit
    render :edit
  end

  def create
    @task = @list.tasks.new(task_params)
    if @task.save
      @task.priority = @task.id
      @task.save
      redirect_to board_list_path(@list.board_id, @list)
    else
      render :new
    end
  end

  private
  def set_list
    @list = List.find(params[:list_id])
  end

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:name, :priority, :description, :completed, :list_id)
  end
end
