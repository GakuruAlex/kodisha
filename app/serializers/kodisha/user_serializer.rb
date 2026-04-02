class Kodisha::UserSerializer < ActiveModel::Serializer
  attributes :id, :phonenumber, :firstname, :lastname, :email_address
  has_one :tenant_profile
  has_one :landlord_profile

  def fullname
    "#{object.firstname} #{object.lastname}"
  end
end
