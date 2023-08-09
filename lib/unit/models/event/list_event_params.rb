# frozen_string_literal: true

# params for listing events
# https://docs.unit.co/events#list-events
module Unit
  module Event
    class ListEventParams
      attr_reader :limit, :offset, :type, :since, :_until

      # @param limit [Integer]
      # @param offset [Integer]
      # @param type [Array<String>] - optional
      # @param since [String] - optional
      # @param _until [String] - optional
      def initialize(limit = EVENT_LIST_LIMIT, offset = EVENT_LIST_OFFSET, type = nil, since = nil, _until = nil)
        @limit = limit
        @offset = offset
        @type = type
        @since = since
        @_until = _until
      end

      def to_hash
        params = {
          "page[limit]": limit,
          "page[offset]": offset,
          "filter[since]": since,
          "filter[until]": _until
        }
        type&.each_with_index&.map do |val, index|
          params.merge!({ "filter[type][#{index}]": val })
        end
        params.compact
      end
    end
  end
end
