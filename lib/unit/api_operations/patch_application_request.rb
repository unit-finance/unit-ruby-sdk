# frozen_string_literal: true

class PatchApplicationRequest
  attr_reader :application_id, :type, :tags

  def initialize(application_id, type, tags = nil)
    @application_id = application_id
    @type = type
    @tags = tags
  end

  def to_json_api
    payload = {
      "data": {
        "type": type,
        "attributes": {}
      }
    }.to_json
    attributes = JSON.parse(payload)["data"]["attributes"]
    attributes["tags"] = tags if tags
    payload
  end
end
