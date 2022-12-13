# frozen_string_literal: true

# Creates request for uploading a document
# @see https://docs.unit.co/application-documents/#upload-document
module Unit
  module Application
    class UploadDocumentRequest
      attr_reader :application_id, :document_id, :file, :file_type, :content_type, :is_back_side

      # @param application_id [String] The application ID
      # @param document_id [String] The document ID
      # @param file [String] The file path
      # @param file_type [String] The file type
      # @option file_type [String] :pdf
      # @option file_type [String] :jpg
      # @option file_type [String] :png
      # @param is_back_side [Boolean] The file is back side
      def initialize(application_id, document_id, file, file_type, is_back_side: false)
        @application_id = application_id
        @document_id = document_id
        @file = file
        @file_type = file_type
        @is_back_side = is_back_side
      end
    end
  end
end
