# frozen_string_literal: true

class ListApplicationParams
  attr_reader :offset, :limit, :email, :tags, :query, :sort

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
    params = { "page[limit]": limit, "page[offset]": offset }
    params["filter[email]"] = email if email
    params["filter[query]"] = query if query
    params["filter[tags]"] = tags if tags
    params["sort"] = sort if sort
    params
  end
end
