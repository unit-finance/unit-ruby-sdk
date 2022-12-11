# frozen_string_literal: true

# class that represents objects that can be created
# Unit's resources include applications, customers, cards, accounts, transactions
module Unit
  class UnitResource
    attr_reader :id, :type, :attributes, :relationships

    # @param id [String] The resource's ID
    # @param type [String] The type of the resource
    # @param attributes [Hash] The attributes
    # @param relationships [Hash] The relationships
    def initialize(id, type, attributes, relationships)
      @id = id
      @type = type
      @attributes = attributes
      @relationships = relationships
    end
  end
end
