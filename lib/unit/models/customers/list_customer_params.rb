# frozen_string_literal: true

# params for listing customers
# See: https://docs.unit.co/customers#list-customers
class ListCustomerParams
  attr_reader :limit, :offset, :query, :email, :tags, :status, :sort

  # @param optional limit [Integer] Maximum number of resources that will be returned. Maximum is 1000 resources.
  # @param optional offset [Integer] Number of resources to skip. See pagination: https://docs.unit.co/#intro-pagination
  # @param optional query [String] Search term according to the: https://docs.unit.co/#full-text-search
  # @param optional email [String] Filter customers by email address (case sensitive).
  # @param optional tags [Hash] Filter customers by tags. More information regarding tags: https://docs.unit.co/#tags
  # @param optional status [String] Filter customers by status.
  # @option status [String] "Active" Filter customers by status "active"
  # @option status [String] "Archived" Filter customers by status "archived"
  # @param optional sort [String] Sorts the resources by the specified field.
  # @option sort=createdAt for ascending order
  # @option sort=-createdAt (leading minus sign) for descending order.
  def initialize(limit = 100, offset = 0, query = nil, email = nil, tags = nil, status = nil,
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
    params.compact!
  end
end
