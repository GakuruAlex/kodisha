class Landlord::Estate::UtilityIndexSerializer < ActiveModel::Serializer
  attributes :id, :name, :meter_no, :last_reading
end
