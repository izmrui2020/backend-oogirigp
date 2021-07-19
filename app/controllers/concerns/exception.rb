module Api::Exceptions
  class RescuableException < StandardError
    attr_accessor :status

    def initialize(status = 500, message = "Error")
      super(message)
      @status = status
    end
  end

  class UnAuthenticationException < RescuableException
    def initialize(message = "Unauthorized")
      super(401, message)
    end
  end
end