# frozen_string_literal: true

# Evaluation parameters for a particular entity.
class EvaluationParams
  attr_reader :use_selfie_verification, :required_verification

  def initialize(use_selfie_verification = nil, required_verification = nil)
    @use_selfie_verification = use_selfie_verification
    @required_verificaion = required_verification
  end

  def represent
    {
      use_selfie_verification: use_selfie_verification,
      required_verification: required_verification
    }
  end
end
