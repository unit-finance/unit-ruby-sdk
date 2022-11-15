# frozen_string_literal: true

class RawUnitObject
  attr_reader :id, :type, :attributes, :relationships

  def initialize(id, type, attributes, relationships)
    @id = id
    @type = type
    @attributes = attributes
    @relationships = relationships
  end

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
