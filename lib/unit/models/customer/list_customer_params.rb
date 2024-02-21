# frozen_string_literal: true

# params for listing customers
# @see https://docs.unit.co/customers#list-customers
module Unit
  module Customer
    class ListCustomerParams
      attr_reader :limit, :offset, :query, :email, :tags, :status, :sort

      # @param limit [Integer] - optional
      # @param offset [Integer] - optional
      # @param query [String] - optional
      # @param email [String] - optional
      # @param tags [Hash] - optional
      # @param status [String] - optional
      # @param sort [String] - optional
      def initialize(limit = CUSTOMER_LIST_LIMIT, offset = CUSTOMER_LIST_OFFSET, query = nil, email = nil, tags = nil, status = nil,
                     sort = nil)
        @limit = limit
        @offset = offset
        @query = query
        @email = email
        @tags = tags
        @status = status
        @sort = sort
      end

      def to_hash
        params = { "page[limit]": limit,
                   "page[offset]": offset,
                   "filter[query]": query,
                   "filter[email]": email,
                   "filter[tags]": tags,
                   "filter[status]": status,
                   "sort": sort }
        params.compact
      end
    end
  end
end
