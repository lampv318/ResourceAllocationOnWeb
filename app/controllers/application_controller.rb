class ApplicationController < ActionController::Base
  include SessionsHelper
  include GeneticHelper
  include ConvertHelper
  include GeneticLibHelper
end
