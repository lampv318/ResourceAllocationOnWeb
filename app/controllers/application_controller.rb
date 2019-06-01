class ApplicationController < ActionController::Base
  require 'will_paginate/array'
  
  include SessionsHelper
  include GeneticHelper
  include ConvertHelper
  include GeneticLibHelper
end
