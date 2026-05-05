class Landlord::Estate::HouseSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :house_name, :is_occupied, :house_category, :images
  has_many :utilities, serializer: Landlord::Estate::UtilityIndexSerializer
  def images
    return nil unless object.images.attached?
    object.images.map do |image|
      rails_blob_url(image, only_path: true)
    end
  end
end
