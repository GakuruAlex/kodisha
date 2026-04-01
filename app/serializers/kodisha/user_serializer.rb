class Kodisha::UserSerializer < ActiveModel::Serializer
  attributes :id, :phonenumber, :firstname, :lastname, :email_address, :tenant, :landlord
  has_one :tenant_profile
  has_one :landlord_profile

  def fullname
    "#{object.firstname} #{object.lastname}"
  end
  def tenant
    if object.tenant_profile
      true
    end
  end
  def landlord
   if  object.landlord_profile
     true
   end
  end
end
