# frozen_string_literal: true

require_relative "unit/version"

module Unit
  autoload :ApplicationResource, "unit/api_resources/application_resource"
  autoload :CustomerResource, "unit/api_resources/customer_resource"
end
