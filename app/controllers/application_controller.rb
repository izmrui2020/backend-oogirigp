require_relative './concerns/exception.rb'

class ApplicationController < ActionController::API
  include ErrorRenderable
  include Authenticator

  def authenticate!
    @id = decode(request_header: request.headers)
    puts(@id)
  end

  rescue_from ActiveRecord::RecordNotFound, with: :rescue404
  

end
