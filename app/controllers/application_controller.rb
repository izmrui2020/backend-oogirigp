require './concerns/exception.rb'

class ApplicationController < ActionController::API
  include Error
  include Auth
end
