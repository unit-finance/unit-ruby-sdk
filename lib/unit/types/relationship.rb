# frozen_string_literal: true

require "sorbet-runtime"

class Relationship
  attr_reader :id, :type

  extend T::Sig
  sig do
    params(id: String, type: String).void
  end
  def initialize(id, type)
    @id = id
    @type = type
  end

  sig do
    params(nested: T::Boolean).void
  end
  def represent(nested = true )
    nested ? { "data": { "id": id, "type": type } } : { "id": id, "type": type }
  end
end
