# frozen_string_literal: true

module SmartId
  class Exception < StandardError; end
  class InvalidParamsError < StandardError; end
  class SSLCertificateNotVerified < StandardError; end
  class InvalidResponseCertificate < StandardError; end
  class InvalidResponseSignature < StandardError; end
  class UserNotFoundError < StandardError; end
  class OutdatedApiError < StandardError; end
  class SystemUnderMaintenanceError < StandardError; end

  class ConnectionError < StandardError

    attr_reader :original_error

    def initialize(original_error)
      @original_error = original_error
    end

  end

  class IncorrectAccountLevelError < StandardError

    def message
      'User exists, but has lower level account than required by request'
    end

  end
end
