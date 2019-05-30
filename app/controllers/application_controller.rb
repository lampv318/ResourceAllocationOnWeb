class ApplicationController < ActionController::Base
  include SessionsHelper
  include GeneticHelper
  include ConvertHelper
end
