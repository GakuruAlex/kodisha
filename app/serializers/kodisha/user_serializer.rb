class Kodisha::UserSerializer < ActiveModel::Serializer
  attributes :id, :firstname, :lastname, :email_address, :role, :phonenumber
  has_one :tenant_profile
  has_one :landlord_profile
end
