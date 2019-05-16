class ProjectsController < ApplicationController
  def index
  end

  def show
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      flash[:success] = "Successfully"
      redirect_to user_path current_user
    else
      flash[:danger] = "Something went wrong"
      render 'new'
    end
  end

  private
  def project_params
    params.require(:project).permit(:user_id, :name, :number_of_task, :number_of_develop,
      :description, :dependence, :matrix_experiment, :level_experience)
  end
end
