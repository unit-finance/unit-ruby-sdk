# frozen_string_literal: true

module Unit
  module Types
    class FullName
      attr_reader :first, :last

      # @param first [String] The first name
      # @param last [String] The last name
      def initialize(first, last)
        @first = first
        @last = last
      end

      def represent
        {
          first: first,
          last: last
        }
      end
    end
  end
end
