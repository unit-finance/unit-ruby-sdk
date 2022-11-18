# frozen_string_literal: true

class UploadDocumentRequest
  attr_reader :application_id, :document_id, :file, :file_type, :is_back_side

  def initialize(application_id, document_id, file, file_type,
                 is_back_side = nil)
    @application_id = application_id
    @document_id = document_id
    @file = file
    @file_type = file_type
    @is_back_side = is_back_side
  end

  def to_json_api
    payload = {
      data: {
        attributes: {
          file: file,
          fileType: file_type,
          isBackSide: is_back_side
        }
      }
    }
    attributes = payload[:data][:attributes].compact!
    payload[:data][:attributes] = attributes
    payload.to_json
  end
end
