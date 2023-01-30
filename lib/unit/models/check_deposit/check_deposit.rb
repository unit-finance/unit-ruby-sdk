# frozen_string_literal: true

module Unit
  module CheckDeposit
    CHECK_DEPOSIT_LIMIT = 100
    CHECK_DEPOSIT_OFFSET = 0

    autoload :CreateCheckDepositRequest, "unit/models/check_deposit/create_check_deposit_request"
    autoload :GetRequest, "unit/models/check_deposit/get_request"
    autoload :ListDepositParams, "unit/models/check_deposit/list_deposit_params"
    autoload :UploadImageRequest, "unit/models/check_deposit/upload_image_request"
    autoload :GetImageRequest, "unit/models/check_deposit/get_image_request"
    autoload :PatchDepositRequest, "unit/models/check_deposit/patch_deposit_request"

    class << self
      # Create a check deposit
      # @see https://docs.unit.co/check-deposits#create-check-deposit
      # @param account_id [String]
      # @param amount [Integer]
      # @param description [String]
      # @param tags [Hash] - optional
      # @param idempotency_key [String] - optional
      def create_deposit(account_id:, amount:, description:, tags: nil, idempotency_key: nil)
        request = CreateCheckDepositRequest.new(account_id, amount, description, tags, idempotency_key)
        Unit::Resource::CheckDepositResource.create_deposit(request)
      end

      # Get a check deposit by calling Unit's API
      # @see https://docs.unit.co/check-deposits#get-specific-check-deposit
      # @param deposit_id [String]
      # @param include [Array<String>] - optional
      def get_deposit(deposit_id:, include: nil)
        request = GetRequest.new(deposit_id, include)
        Unit::Resource::CheckDepositResource.get(request)
      end

      # List check deposits
      # @see https://docs.unit.co/check-deposits#list-check-deposits
      # @param limit [Integer] - optional
      # @param offset [Integer] - optional
      # @param account_id [String] - optional
      # @param customer_id [String] - optional
      # @param tags [Hash] - optional
      # @param sort [String] - optional
      # @param include [Array<String>] - optional
      def list_deposit(limit: CHECK_DEPOSIT_LIMIT, offset: CHECK_DEPOSIT_OFFSET, account_id: nil,
                       customer_id: nil, tags: nil, sort: nil, include: nil)
        request = ListDepositParams.new(limit, offset, account_id, customer_id, tags, sort, include)
        Unit::Resource::CheckDepositResource.list(request)
      end

      # Upload an image front side for a check deposit
      # @see https://docs.unit.co/check-deposits#upload-front-side-image
      # @param deposit_id [String]
      # @param file [String] - The file content - optional
      # @param is_front_side [Boolean] - optional
      def upload_image_front(deposit_id:, file:, is_front_side: true)
        request = UploadImageRequest.new(deposit_id, file, is_front_side: is_front_side)
        Unit::Resource::CheckDepositResource.upload(request)
      end

      # Upload an image back side for a check deposit
      # @see https://docs.unit.co/check-deposits#upload-back-side-image
      # @param deposit_id [String]
      # @param file [String] - optional
      # @param is_front_side [Boolean] - optional
      def upload_image_back(deposit_id:, file:, is_front_side: false)
        request = UploadImageRequest.new(deposit_id, file, is_front_side: is_front_side)
        Unit::Resource::CheckDepositResource.upload(request)
      end

      # Get a check deposit image front side
      # @see https://docs.unit.co/check-deposits#get-specific-check-deposit-front-image
      # @param deposit_id [String]
      # @param file [String] - optional
      # @param is_front_side [Boolean] - optional
      def get_image_front(deposit_id:, is_front_side: true)
        request = GetImageRequest.new(deposit_id, is_front_side: is_front_side)
        Unit::Resource::CheckDepositResource.get_image(request)
      end

      # Get a check deposit image back side
      # @see https://docs.unit.co/check-deposits#get-specific-check-deposit-back-image
      # @param deposit_id [String]
      # @param file [String] - optional
      # @param is_front_side [Boolean] - optional
      def get_image_back(deposit_id:, is_front_side: false)
        request = GetImageRequest.new(deposit_id, is_front_side: is_front_side)
        Unit::Resource::CheckDepositResource.get_image(request)
      end

      # Update a check deposit
      # @see https://docs.unit.co/check-deposits#update-check-deposit
      # @param deposit_id [String]
      # @param tags [Hash] - optional
      def update_deposit(deposit_id:, tags:)
        request = PatchDepositRequest.new(deposit_id, tags)
        Unit::Resource::CheckDepositResource.update(request)
      end

      # Confirm check deposit details
      # @see https://docs.unit.co/check-deposits#confirm-check-deposit-details
      # @param deposit_id [String]
      def confirm_details(deposit_id:)
        Unit::Resource::CheckDepositResource.confirm_details(deposit_id)
      end
    end
  end
end
