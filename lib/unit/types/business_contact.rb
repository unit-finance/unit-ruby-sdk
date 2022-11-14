require 'sorbet-runtime'

class BusinessContact
  extend T::Sig
  sig do
    params(full_name: FullName, email: String, phone: Phone).void
  end
  def initialize(full_name, email, phone)
    @full_name = full_name
    @email = email
    @phone = phone
  end


end