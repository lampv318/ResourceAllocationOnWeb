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

  def run_project
    duration = convert_to_arr(params[:duration])
    dependence = convert_to_arr(params[:dependence])
    treq = convert_treq(params[:matrix_experiment])
    lexp = convert_lexp(params[:level_experience])
    # fitness = get_fitness_of_duration(duration, dependence)
    get_value(duration, dependence, treq, lexp)
    get_best(100)
    redirect_to root_path
  end

  private
  
  def project_params
    params.require(:project).permit(:user_id, :name, :number_of_task, :number_of_develop,
      :description, :duration, :dependence, :matrix_experiment, :level_experience,
      :weighted_of_fitness_1, :weighted_of_fitness_2)
  end
end
