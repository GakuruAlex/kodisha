class Landlord::EstateSerializer < ActiveModel::Serializer
  attributes :id, :has_vacancy, :name,  :location, :num_houses
  # has_many :houses, serializer: Landlord::Estate::HouseSerializer
  def num_houses
    object.houses.count
  end
end
