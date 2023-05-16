# frozen_string_literal: true

# params for listing application form params
# @see https://docs.unit.co/application-forms#list-application-forms
module Unit
  module ApplicationForm
    class ListApplicationFormParams
      attr_reader :limit, :offset, :tags, :sort

      # @param limit [Integer] - optional
      # @param offset [Integer] - optional
      # @param tags [Hash] - optional
      # @param sort [String] - optional
      def initialize(limit = APPLICATION_FORM_LIST_LIMIT, offset = APPLICATION_FORM_LIST_OFFSET, tags = nil, sort = nil)
        @limit = limit
        @offset = offset
        @tags = tags
        @sort = sort
      end

      def to_hash
        params = { "page[limit]": limit,
                   "page[offset]": offset,
                   "filter[tags]": tags,
                   "sort": sort }
        params.compact
      end
    end
  end
end
