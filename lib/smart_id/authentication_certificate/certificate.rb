# frozen_string_literal: true

module SmartId
  module AuthenticationCertificate
    class Certificate

      def initialize(base64_cert)
        @base64_cert = base64_cert
      end

      def content
        @content ||= SmartId::AuthenticationCertificate::Content.new(cert.subject.to_s)
      end

      def cert
        @cert ||= OpenSSL::X509::Certificate.new(Base64.decode64(@base64_cert))
      end

    end
  end
end
