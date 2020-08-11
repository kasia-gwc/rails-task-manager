class TasksController < ApplicationController

  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(strong_params)
    @task.save

    redirect_to task_path(@task)
  end

  def edit
  end

  def update
    @task.update(strong_params)

    redirect_to task_path(@task)
  end

  def destroy
    @task.destroy

    redirect_to task_path
  end

  private

  def strong_params # Whitelist approach - you specify which keys in the params hash you allow

    params.require(:task).permit(:title, :details, :completed)
      # params = {
      #  task = { name: "Ishin", address: "Mitte", rating: 4 }
      #  }
   end


   def set_task
    @task = Task.find(params[:id])
   end
end
