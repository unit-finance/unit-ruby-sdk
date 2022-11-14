# frozen_string_literal: true

require "sorbet-runtime"
class FullName
  attr_reader :first, :last

  extend T::Sig

  sig do
    params(first: String, last: String).void
  end
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

  def self.from_json_api(data)
    FullName.new(data["first"], data["last"])
  end
end
