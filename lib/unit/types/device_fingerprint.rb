# frozen_string_literal: true

require "sorbet-runtime"

class DeviceFingerprint
  attr_reader :value, :provider

  extend T::Sig
  sig do
    params(value: String, provider: String)
  end
  def initialize(value, provider = "iovation")
    @value = value
    @provider = provider
  end
end
