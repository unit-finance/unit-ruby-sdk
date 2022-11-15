# frozen_string_literal: true

require "sorbet-runtime"

class UnitResponse
  extend T::Sig

  def initialize(data, included)
    @data = data
    @included = included
  end
end
