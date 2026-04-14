class Landlord::EstateSerializer < ActiveModel::Serializer
  attributes :id, :has_vacancy, :name,  :location, :houses_count
  has_many :houses, serializer: Landlord::Estate::HouseSerializer
end
