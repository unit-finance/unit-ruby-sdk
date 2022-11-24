# frozen_string_literal: true

class UnitResource
  attr_reader :id, :type, :attributes, :relationships

  # @param id [String] The application id
  # @param type [String] The type of application
  # @param attributes [Hash] The attributes
  # @param relationships [Hash] The relationships
  # @option type [String] :individualApplication The type of individual application
  # @option type [String] :businessApplication The type of business application
  # @option type [String] :document The type of document
  def initialize(id, type, attributes, relationships)
    @id = id
    @type = type
    @attributes = attributes
    @relationships = relationships
  end
end
