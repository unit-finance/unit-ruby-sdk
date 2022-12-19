# frozen_string_literal: true

# params for list applications
# @see https://docs.unit.co/applications/#list-applications
module Unit
  module Application
    class ListApplicationParams
      attr_reader :offset, :limit, :email, :tags, :query, :status, :sort

      # @param offset [Integer] Number of resources to skip. See pagination: https://docs.unit.co/#intro-pagination
      # @param limit [Integer] The limit Maximum number of resources that will be returned. Maximum is 1000 resources.
      # @param email [String] Filter applications by email address (case sensitive).
      # @param tags [Hash] Filter applications by tags. More information regarding tags: https://docs.unit.co/#tags
      # @param query [String] Search term according to the: https://docs.unit.co/#full-text-search
      # @param status [String] Filter applications by status: https://docs.unit.co/applications/#application-statuses
      # @param sort [String] Sorts the resources by the specified field.
      # @option sort=createdAt for ascending order
      # @option sort=-createdAt (leading minus sign) for descending order.
      def initialize(offset = APPLICATION_LIST_OFFSET, limit = APPLICATION_LIST_LIMIT, email = nil, tags = nil,
                     query = nil, status = nil, sort = nil)
        @offset = offset
        @limit = limit
        @email = email
        @tags = tags
        @query = query
        @status = status
        @sort = sort
      end

      def to_hash
        params = { "page[limit]": limit,
                   "page[offset]": offset,
                   "filter[email]": email,
                   "filter[tags]": tags,
                   "filter[query]": query,
                   "filter[status]": status,
                   "sort": sort }
        params.compact!
      end
    end
  end
end
