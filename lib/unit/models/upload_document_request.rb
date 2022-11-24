# frozen_string_literal: true

# Creates request for uploading a document
class UploadDocumentRequest
  attr_reader :application_id, :document_id, :file, :file_type, :content_type, :is_back_side

  # @param application_id [Integer] The application ID
  # @param document_id [Integer] The document ID
  # @param file [String] The file path
  # @param file_type [String] The file type
  # @option file_type [String] :pdf
  # @option file_type [String] :jpg
  # @option file_type [String] :png
  # @param is_back_side [Boolean] The file is back side
  def initialize(application_id, document_id, file, file_type,
                 is_back_side = nil)
    @application_id = application_id
    @document_id = document_id
    @file = file
    @file_type = file_type
    @is_back_side = is_back_side
  end

  # @return [String] The Json API payload
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
    payload[:data][:attributes].compact!
    payload.to_json
  end
end
