require_relative "../api_operations/individual_application_dto"
require_relative "../api_operations/application_document_dto"
require_relative "../types/relationship"
require_relative "../types/relationship_array"


MAPPINGS = {
  "individualApplication": lambda { |id, type, attributes, relationships|
    IndividualApplicationDto.from_json_api(id, type, attributes, relationships)},
  "document": lambda { |id, type, attributes, relationships|
    ApplicationDocumentDto.from_json_api(id, type, attributes)}
}.freeze


def split_json_api_single_response(payload)
  id = payload["id"]
  type = payload["type"]
  attributes = payload["attributes"]
  if payload["relationships"]
    relationships = {}
    payload["relationships"].map do |key, value|
      if value["data"].is_a?(Array)
        relationships[key] = RelationshipArray.new(value["data"])
      else
        relationships[key] = Relationship.new(value["data"]["id"], value["data"]["type"])
      end
    end
  end
  [id, type, attributes, relationships]
end

def split_json_api_array_response(payload)
  unless payload.is_a?(Array)
    raise "Could not parse response. Expected an array of data objects."

  end
  dtos = []
  payload.map do |data|
    dtos << split_json_api_single_response(data)
  end
  dtos
end

def mapping_wrapper(id, type, attributes, relationships)
  MAPPINGS[type.to_sym].call(id, type, attributes, relationships)
end


class DtoDecoder
  def self.decode(payload)
    if payload.is_a?(Array)
      dtos = split_json_api_array_response(payload)
      response = []
      dtos.map do |id, type, attributes, relationships|
        response << mapping_wrapper(id, type, attributes, relationships)
      end
      response
    else
      id, type, attributes, relationships = split_json_api_single_response(payload)
      mapping_wrapper(id, type, attributes, relationships)
    end
  end
end

