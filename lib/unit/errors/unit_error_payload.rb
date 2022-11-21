# frozen_string_literal: true

class UnitErrorPayload

  attr_reader :title, :status, :detail, :details, :source, :code

  # @param title [String] The title
  # @param status [String] The status
  # @param detail [String] The detail
  # @param details [String] The details
  # @param source [Hash] The source
  # @param code [String] The code
  def initialize(title, status, detail, details = nil,
                 source = nil, code = nil)
    @title = title
    @status = status
    @detail = detail
    @details = details
    @source = source
    @code = code
  end
end
