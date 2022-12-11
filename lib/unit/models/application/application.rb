# frozen_string_literal: true

module Unit
  module Application
    autoload :CreateBusinessApplicationRequest, "unit/models/application/create_business_application_request"
    autoload :CreateIndividualApplicationRequest, "unit/models/application/create_individual_application_request"
    autoload :ListApplicationParams, "unit/models/application/list_application_params"
    autoload :PatchApplicationRequest, "unit/models/application/patch_application_request"
    autoload :UploadDocumentRequest, "unit/models/application/upload_document_request"
  end
end
