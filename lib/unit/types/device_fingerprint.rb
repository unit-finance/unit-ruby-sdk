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

  def represent
    {
      value: value,
      provider: provider
    }
  end

  def self.from_json_api(data)
    DeviceFingerprint.new(data["value"], data["provider"])
  end
end
