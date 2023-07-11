# frozen_string_literal: true

module Unit
  module Institution
    class << self
      # Get institution by routing number
      # @see https://docs.unit.co/institutions/#get-institution-by-routingNumber
      # @param routing_number [String]
      def get_institution(routing_number:)
        Unit::Resource::InstitutionResource.get_institution(routing_number)
      end
    end
  end
end
