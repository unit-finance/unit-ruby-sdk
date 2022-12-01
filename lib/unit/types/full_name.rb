# frozen_string_literal: true

class FullName
  attr_reader :first, :last

  # @param first [String] The first name
  # @param last [String] The last name
  def initialize(first, last)
    @first = first
    @last = last
  end

  # @return [Hash]
  def represent
    {
      first: first,
      last: last
    }
  end
end
