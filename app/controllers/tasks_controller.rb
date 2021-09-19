class TasksController < ApplicationController
  before_action :find_project

  def index
    @tasks = @project.tasks
  end

  def show
    @task = @project.tasks.find_by(params[:id])
  end

  def new
    @task = @project.tasks.new
  end

  def create
    @task = @project.tasks.build(task_params)
    if @task.save
      redirect_to user_project_path(current_user, @project), flash: { success: 'Task was created! '}
    else
      render :new, flash: { alert: 'Some errors occured'}
    end
  end

  def edit
    @user = current_user
  end

  def update
    @task = @project.tasks.find(params[:id])
    if @task.update(task_params)
      redirect_to user_project_path(current_user, @project), flash: { success: 'Task was created! '}
    else
      render :edit
    end
  end

  def update_task_inline
    @task = @project.tasks.find(params[:id])
    #@task.update!(task_params)
    if @task.update(task_params)
      redirect_to user_project_path(current_user, @project), flash: { success: 'Task was created! '}
    else
      render :index
    end
  end

  private

  def find_project
    @project = current_user.projects.find(params[:project_id])
  end

  def task_params
    params.require(:task).permit(:task_name, :body, :status, :deadline, :priority)
  end

end
