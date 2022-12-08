# frozen_string_literal: true

# represents relationship Array in the JSON API payload
class RelationshipArray
  attr_reader :data

  # @param array [Array] The array of relationships
  def initialize(array)
    relationships = []
    array.map do |item|
      relationships << if item.is_a?(Relationship)
                         item
                       else
                         Relationship.new(item[:data][:id], item[:data][:type]).represent end
      p item
    end
    @data = relationships
  end

  def represent
    { "data": data }
  end
end
