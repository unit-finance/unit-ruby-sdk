# frozen_string_literal: true

module Unit
  class UnitErrorPayload
    attr_reader :title, :status, :detail, :details, :source, :code

    # @param title [String] The title of the error
    # @param status [String] The HTTP status code
    # @param detail [String] The additional information about the error
    # @param details [String] The details of the error
    # @param source [Hash] The source of the error
    # @param code [String] A Unit-specific code, uniquely identifying the error type
    # Check out documentation link for more details: https://docs.unit.co/about-jsonapi/#intro-errors
    def initialize(title, status, detail, details = nil, source = nil, code = nil)
      @title = title
      @status = status
      @detail = detail
      @details = details
      @source = source
      @code = code
    end

    def self.from_json_api(error)
      new(
        error["title"],
        error["status"],
        error["detail"],
        error["details"],
        error["source"],
        error["code"]
      )
    end
  end
end
