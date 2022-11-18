# frozen_string_literal: true

require_relative "../api_resources/individual_application_dto"
require_relative "../api_resources/business_application_dto"
require_relative "../api_resources/application_document_dto"
require_relative "../types/relationship"
require_relative "../types/relationship_array"
require_relative "../types/raw_unit_object"

MAPPINGS = {
  "individualApplication": lambda { |id, type, attributes, relationships|
                             IndividualApplicationDto.from_json_api(id, type, attributes, relationships)
                           },
  "document": lambda { |id, type, attributes, _relationships|
                ApplicationDocumentDto.from_json_api(id, type, attributes)
              },
  "businessApplication": lambda { |id, type, attributes, relationships|
                           BusinessApplicationDto.from_json_api(id, type, attributes, relationships)
                         }
}.freeze

def split_json_api_single_response(payload)
  id = payload["id"]
  type = payload["type"]
  attributes = payload["attributes"]
  if payload["relationships"]
    relationships = {}
    payload["relationships"].map do |key, value|
      relationships[key] = if value["data"].is_a?(Array)
                             RelationshipArray.new(value["data"])
                           else
                             Relationship.new(value["data"]["id"], value["data"]["type"])
                           end
    end
  end
  [id, type, attributes, relationships]
end

def split_json_api_array_response(payload)
  raise "Could not parse response. Expected an array of data objects." unless payload.is_a?(Array)

  dtos = []
  payload.map do |data|
    dtos << split_json_api_single_response(data)
  end
  dtos
end

def mapping_wrapper(id, type, attributes, relationships)
  if MAPPINGS.key?(type.to_sym)
    MAPPINGS[type.to_sym].call(id, type, attributes, relationships)
  else
    RawUnitObject.new(id, type, attributes, relationships)
  end
end

class DtoDecoder
  def self.decode(payload)
    return nil if payload.nil?

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
