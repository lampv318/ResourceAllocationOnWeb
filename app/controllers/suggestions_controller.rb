class SuggestionsController < ApplicationController 
  def create
    @suggestion = Suggestion.new(suggestion_params)
    if @suggestion.save
      flash[:success] = "Successfully"
      redirect_to project_path params[:project_id]
    else
      flash[:danger] = "Something went wrong"
    end
  end

  private 
  def suggestion_params
    params.require(:suggestion).permit(:genes, :fitness, :project_id)
  end
end
