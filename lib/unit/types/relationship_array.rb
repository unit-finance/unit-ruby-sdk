# frozen_string_literal: true

require "sorbet-runtime"

class RelationshipArray
  extend T::Sig

  attr_reader :data

  sig do
    params(array: Array).void
  end
  def initialize(array)
    relationships = []
    array.each do |item|
      relationships << if item.is_a?(Relationship)
                         item
                       else
                         Relationship.new(item["id"], item["type"]) end
    end
    @data = relationships
  end

  def represent
    { "data": data.map(&:represent) }
  end

  def self.from_ids_array(type, ids)
    RelationshipArray.new(
      ids.map do |id|
        Relationship.new(id, type)
      end
    )
  end
end
