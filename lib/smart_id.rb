# frozen_string_literal: true

require 'smart_id/version'
require 'smart_id/utils/authentication_hash'
require 'smart_id/utils/certificate_validator'
require 'smart_id/utils/verification_code_calculator'
require 'smart_id/api/request'
require 'smart_id/api/response'
require 'smart_id/api/confirmation_response'
require 'smart_id/api/authentication/identity_number'
require 'smart_id/api/authentication/document'
require 'smart_id/api/authentication/confirmation_poller'
require 'smart_id/authentication_certificate/certificate'
require 'smart_id/authentication_certificate/content'

module SmartId
  @@environment = 'DEMO' # possible options are demo and production
  @@relying_party_uuid = nil
  @@relying_party_name = nil
  @@default_certificate_level = 'ADVANCED' # possible values are "ADVANCED", "QUALIFIED"
  @@poller_timeout_seconds = 10
  @@display_text_60 = 'Up to 60 characters of text here'

  def self.configure
    yield(self)
  end

  def self.relying_party_uuid=(value)
    @@relying_party_uuid = value
  end

  def self.relying_party_uuid
    @@relying_party_uuid
  end

  def self.relying_party_name=(value)
    @@relying_party_name = value
  end

  def self.relying_party_name
    @@relying_party_name
  end

  def self.default_certificate_level=(value)
    @@default_certificate_level = value
  end

  def self.default_certificate_level
    @@default_certificate_level
  end

  def self.poller_timeout_seconds=(value)
    @@poller_timeout_seconds = value
  end

  def self.poller_timeout_seconds
    @@poller_timeout_seconds
  end

  def self.environment=(value)
    @@environment = value.upcase
  end

  def self.environment
    @@environment
  end

  def self.display_text_60=(value)
    @@display_text_60 = value
  end

  def self.display_text_60
    @@display_text_60
  end
end
