class Landlord::EstateSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :has_vacancy, :name,  :location, :houses_count, :image
  has_many :houses, serializer: Landlord::Estate::HouseSerializer


  def image
    return nil unless object.image.attached?
    rails_representation_url(
      object.image.variant(resize_to_limit: [ 800, 600 ]).processed,
      host: instance_options[:host]
    )
  end
end
