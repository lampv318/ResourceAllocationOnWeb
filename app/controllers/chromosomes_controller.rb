class ChromosomesController < ApplicationController
  def run_project
    @chromosome = Chromosome.new
    # byebug
    @chromosome.genes = Chromosome.generate_genes(11)
    redirect_to root_path
  end

  private
  
  def project_params
    params.require(:project).permit(:user_id, :name, :number_of_task, :number_of_develop,
      :description, :duration, :dependence, :matrix_experiment, :level_experience,
      :weighted_of_fitness_1, :weighted_of_fitness_2)
  end
end
