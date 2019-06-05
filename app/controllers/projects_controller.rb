class ProjectsController < ApplicationController
  def index
  end

  def show
    @project = Project.find(params[:id])
    @suggestion = @project.suggestions
  end

  def new
    @project = Project.new
    byebug
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      flash.now[:success] = "Successfully"
      redirect_to user_path current_user
    else
      flash[:danger] = "Something went wrong"
      render 'new'
    end
  end

  def run_project
    @suggestion = Suggestion.new
    duration = convert_to_arr(params[:duration])
    dependence = convert_to_arr(params[:dependence])
    treq = convert_treq(params[:matrix_experiment])
    lexp = convert_lexp(params[:level_experience])
    weighted_of_fitness_1 = params[:weighted_of_fitness_1]
    weighted_of_fitness_2 = params[:weighted_of_fitness_2]
    get_value(duration, dependence, treq, lexp, weighted_of_fitness_1, weighted_of_fitness_2)
    project_id = params[:project_id].to_i
    @parents1 = get_best(100)
    @parents = @parents1.reverse.paginate(page: params[:page], per_page: 10)
  end

  private
  
  def project_params
    params.require(:project).permit(:user_id, :name, :number_of_task, :number_of_develop,
      :description, :duration, :dependence, :matrix_experiment, :level_experience,
      :weighted_of_fitness_1, :weighted_of_fitness_2)
  end
end
