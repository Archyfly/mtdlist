class ProjectsController < ApplicationController
  before_action :set_projects, only: %i[index update_inline]
  before_action :authenticate_user!

  def index
  end

  def show
    @project = Project.find(params[:id])
  end

  def new
    @user = current_user
    @project = @user.projects.new
  end

  def create
    @project = current_user.projects.build(project_params)
    if @project.save
      redirect_to user_project_path(current_user, @project), flash: { success: 'Project was added! '}
    else
      render :new, flash: { alert: 'Some errors occured'}
    end
  end

  def edit
    @user = current_user
    @project = @user.projects.find(params[:id])
  end

  def update
    @project = current_user.projects.find(params[:id])
    if @project.update(project_params)
      redirect_to user_projects_path(@project), flash: { success: 'project was updated! '}
    else
      render :edit
    end
  end

  def update_inline
    @project = current_user.projects.find(params[:id])
    if @project.update(project_params)
      redirect_to user_projects_path, flash: { success: 'project was updated! '}
    else
      render :index
    end
  end

  def destroy
    @project = current_user.projects.find(params[:id])
    @project.destroy
    redirect_to user_projects_path, flash: { success: 'Project was deleted! '}
  end

  private

  def set_projects
    @projects = current_user.projects
  end

  def project_params
    params.require(:project).permit(:title, :description)
  end


end
