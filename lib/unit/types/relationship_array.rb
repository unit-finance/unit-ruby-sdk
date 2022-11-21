# frozen_string_literal: true

# represents relationship Array in the JSON API payload
class RelationshipArray
  attr_reader :data

  # @param array [Array] The array of relationships
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

  # @return [Hash] The JSON API payload
  def represent
    { "data": data.map(&:represent) }
  end

  # @param type [String] The type of the relationship
  # @@param [Array] The array of ids
  # @return [RelationshipArray] The relationship array
  def self.from_ids_array(type, ids)
    RelationshipArray.new(
      ids.map do |id|
        Relationship.new(id, type)
      end
    )
  end
end
