# frozen_string_literal: true

class DeviceFingerprint
  attr_reader :value, :provider

  # @param value [String] The value
  # @param provider [String] The provider
  def initialize(value, provider = "iovation")
    @value = value
    @provider = provider
  end

  # @return [Hash] The JSON API payload
  def represent
    {
      value: value,
      provider: provider
    }
  end

  # @param data [Hash] The JSON API payload
  def self.from_json_api(data)
    DeviceFingerprint.new(data["value"], data["provider"])
  end
end
