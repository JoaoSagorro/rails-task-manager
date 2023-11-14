class TasksController < ApplicationController
  before_action :set_task, only: %i[details edit update destroy]

  def index
    @task = Task.all
  end

  def details
    @task
  end

  def new
    @task = Task.new
  end

  def create
    created_task = Task.new(task_params)
    created_task.save

    redirect_to tasks_path
  end

  def edit
    @task
  end

  def update
    @task.update(task_params)

    redirect_to tasks_path
  end

  def destroy
    @task.destroy

    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :details)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
