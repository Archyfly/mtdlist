class TasksController < ApplicationController
  before_action :find_project

  def index
    @tasks = @project.tasks.second
  end

  def show
    @task = @project.tasks.find_by(params[:id])
  end

  def new
    @task = @project.tasks.new
  end

  def edit

  end

  def create
    @task = @project.tasks.build(task_params)
    if @task.save
      flash[]
      redirect_to user_project_path(current_user, @project), flash: { success: 'Task was created! '}
    else
      render :new, flash: { alert: 'Some errors occured'}
    end
  end

  private

  def find_project
    @project = current_user.projects(params[:id])
  end

  def task_params
    params.require(:task).permit(:task_name, :body, :status, :deadline, :priority)
  end

end
