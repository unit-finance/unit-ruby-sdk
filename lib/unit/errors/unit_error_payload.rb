# frozen_string_literal: true

require "sorbet-runtime"
class UnitErrorPayload
  extend T::Sig

  sig do
    params(title: String, status: String, detail: T.nilable(String), details: T.nilable(String),
           source: T.nilable(Hash), code: T.nilable(String)).void
  end
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
