class Kodisha::UserSerializer < ActiveModel::Serializer
  attributes :id, :phonenumber, :fullname, :email_address
  has_one :tenant_profile
  has_one :landlord_profile

  def fullname
    "#{object.firstname} #{object.lastname}"
  end
end
