class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @newTask = Task.new
  end

  def create
    Task.create!(tasks_params)
    redirect_to root_path
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(tasks_params)
    redirect_to tasks_path(@tasks)
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
  end

  private

  def tasks_params
    params.require(:task).permit(:details, :title, :completed)
  end

end
