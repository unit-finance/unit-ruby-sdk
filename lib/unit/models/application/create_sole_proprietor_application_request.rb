# frozen_string_literal: true

# Request to create a proprietor application
# @see https://docs.unit.co/applications#create-sole-proprietor-application
module Unit
  module Application
    class CreateSoleProprietorApplicationRequest
      attr_reader :ssn, :passport, :nationality, :full_name, :date_of_birth,
                  :address, :phone, :email, :sole_proprietorship, :ein, :industry,
                  :dba, :power_of_attorney_agent, :evaluation_params, :occupation,
                  :annual_income, :source_of_income, :annual_revenue, :number_of_employees,
                  :business_vertical, :website, :ip, :tags, :idempotency_key,
                  :device_fingerprints, :jwt_subject

      # @param nationality [String]
      # @param full_name [FullName]
      # @param date_of_birth [Date]
      # @param address [Address]
      # @param phone [Phone]
      # @param email [String]
      # @param sole_proprietorship [Boolean]
      # @param industry [String]
      # @param ssn [String] - optional
      # @param passport [String] - optional
      # @param ein [String] - optional
      # @param dba [String] - optional
      # @param power_of_attorney_agent [PowerOfAttorneyAgent] - optional
      # @param evaluation_params [EvaluationParams] - optional
      # @param occupation [String] - optional
      # @param annual_income [String] - optional
      # @param source_of_income [String] - optional
      # @param annual_revenue [String] - optional
      # @param number_of_employees [String] - optional
      # @param business_vertical [String] - optional
      # @param website [String] - optional
      # @param ip [String] - optional
      # @param tags [Hash] - optional
      # @param idempotency_key [String] - optional
      # @param device_fingerprints [Array<DeviceFingerprint>] - optional
      # @param jwt_subject [String] - optional
      def initialize(nationality, full_name, date_of_birth, address, phone,
                     email, industry, ssn = nil, passport = nil, ein = nil, dba = nil, power_of_attorney_agent = nil, evaluation_params = nil,
                     occupation = nil, annual_income = nil, source_of_income = nil, annual_revenue = nil,
                     number_of_employees = nil, business_vertical = nil, website = nil, ip = nil, tags = nil,
                     idempotency_key = nil, device_fingerprints = nil, jwt_subject = nil, sole_proprietorship: true)
        @ssn = ssn
        @passport = passport
        @nationality = nationality
        @full_name = full_name
        @date_of_birth = date_of_birth
        @address = address
        @phone = phone
        @email = email
        @sole_proprietorship = sole_proprietorship
        @ein = ein
        @industry = industry
        @dba = dba
        @power_of_attorney_agent = power_of_attorney_agent
        @evaluation_params = evaluation_params
        @occupation = occupation
        @annual_income = annual_income
        @source_of_income = source_of_income
        @annual_revenue = annual_revenue
        @number_of_employees = number_of_employees
        @business_vertical = business_vertical
        @website = website
        @ip = ip
        @tags = tags
        @idempotency_key = idempotency_key
        @device_fingerprints = device_fingerprints
        @jwt_subject = jwt_subject
      end

      def to_json_api
        payload = {
          data: {
            type: "individualApplication",
            attributes: {
              ssn: ssn,
              passport: passport,
              nationality: nationality,
              fullName: full_name.represent,
              dateOfBirth: date_of_birth,
              address: address.represent,
              phone: phone&.represent,
              email: email,
              soleProprietorship: sole_proprietorship,
              ein: ein,
              industry: industry,
              dba: dba,
              powerOfAttorneyAgent: power_of_attorney_agent&.represent,
              evaluationParams: evaluation_params&.represent,
              occupation: occupation,
              annualIncome: annual_income,
              sourceOfIncome: source_of_income,
              annualRevenue: annual_revenue,
              numberOfEmployees: number_of_employees,
              businessVertical: business_vertical,
              website: website,
              ip: ip,
              tags: tags,
              idempotencyKey: idempotency_key,
              deviceFingerprints: device_fingerprints&.map(&:represent),
              jwtSubject: jwt_subject
            }
          }
        }
        payload[:data][:attributes].compact!
        payload.to_json
      end
    end
  end
end
