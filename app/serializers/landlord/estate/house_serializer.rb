class Landlord::Estate::HouseSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :house_name, :is_occupied, :house_type, :images
  has_many :utilities, serializer: Landlord::Estate::UtilityIndexSerializer
  def images
    return nil unless object.images.attached?
    object.images.map do |image|
      # rails_blob_url(image, only_path: true),       host: instance_options[:host]
      rails_representation_url(
      image.variant(resize_to_limit: [ 800, 600 ]).processed,
      host: instance_options[:host]
    )
    end
  end
end
