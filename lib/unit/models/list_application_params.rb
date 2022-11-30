# frozen_string_literal: true

# params for list applications
class ListApplicationParams
  attr_reader :offset, :limit, :email, :tags, :query, :sort

  # @param offset [Integer] Number of resources to skip. See pagination: https://docs.unit.co/#intro-pagination
  # @param limit [Integer] The limit Maximum number of resources that will be returned. Maximum is 1000 resources.
  # @param email [String] Filter applications by email address (case sensitive).
  # @param tags [String] Filter applications by tags. More information regarding tags: https://docs.unit.co/#tags
  # @param query [String] Search term according to the: https://docs.unit.co/#full-text-search
  def initialize(offset = 0, limit = 100, email = nil, tags = nil,
                 query = nil, sort = nil)
    @offset = offset
    @limit = limit
    @email = email
    @tags = tags
    @query = query
    @sort = sort
  end

  def to_hash
    params = { "page[limit]": limit,
               "page[offset]": offset,
               "filter[email]": email,
               "filter[tags]": tags,
               "filter[query]": query,
               "sort": sort }
    params.compact!
  end
end
