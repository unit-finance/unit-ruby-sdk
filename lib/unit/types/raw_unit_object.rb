# frozen_string_literal: true

class RawUnitObject
  attr_reader :id, :type, :attributes, :relationships

  # @param id [String] The id of the object
  # @param type [String] The type of the object
  # @param attributes [Hash] The attributes of the object
  # @param relationships [Hash] The relationships of the object
  def initialize(id, type, attributes, relationships)
    @id = id
    @type = type
    @attributes = attributes
    @relationships = relationships
  end

  # @return [Hash] The JSON API payload
  def to_json_api
    {
      "data": {
        "type": type,
        "id": id,
        "attributes": attributes,
        "relationships": relationships
      }
    }
  end
end
