class ApplicationController < ActionController::Base
  require 'will_paginate/array'
  
  include SessionsHelper
  include GeneticHelper
  include ConvertHelper
  include GeneticLibHelper

  def logged_in_user
    unless logged_in?
      flash[:danger] = "Please Login"
      redirect_to root_path
    end
  end
end
