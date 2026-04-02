class Kodisha::UserSerializer < ActiveModel::Serializer
  attributes :id, :phonenumber, :firstname, :lastname, :email_address, :landlord, :tenant

  def fullname
    "#{object.firstname} #{object.lastname}"
  end
  def landlord
    object.landlord_profile.present?
  end
  def tenant
    object.tenant_profile.present?
  end
end
