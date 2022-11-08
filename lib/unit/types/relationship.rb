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

  def represent
    { "org": { "data": { "type": type, "id": id } } }
  end

  def self.from_json_api(data)
    payload = data["org"]["data"]
    Relationship.new(payload["id"], payload["type"])
  end
end
