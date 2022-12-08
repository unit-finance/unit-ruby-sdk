# frozen_string_literal: true

require_relative "unit/version"
require "unit/api_resources/application_resource"
require "unit/api_resources/customer_resource"

class Unit
  def initialize(api_url, token)
    @applications = ApplicationResource.new(api_url, token)
    @customers = CustomerResource.new(api_url, token)
  end
end
