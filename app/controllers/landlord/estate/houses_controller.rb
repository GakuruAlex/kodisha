class Landlord::Estate::HousesController < ApplicationController
  before_action :set_estate, only: %i[ index create show update destroy]
  before_action :set_house, only: %i[ show update destroy]
  allow_roles "member", only: %i[index show create update destroy]

  def index
    houses = @estate.houses.includes(:utilities, images_attachments: :blob)
    render json: houses, each_serializer: Landlord::Estate::HouseSerializer, status: :ok, host: request.base_url
  end

  def show
    @house.reload(includes: [ :utilities, images_attachments: :blob ])
    render json: @house, host: request.base_url, status: :ok
  end

  def create
    estate_house = @estate.houses.new(house_params)
    estate_house.images.attach(params[:images]) if params[:images]

    if estate_house.save
      estate_house.reload(includes: [ :utilities, image_attachments: :blob ])
      render json: estate_house,
             serializer: Landlord::Estate::HouseCreateSerializer,
             status: :created,
             host: request.base_url
    else
      render json: { errors: estate_house.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    @house.images.attach(params[:images]) if params[:images]

    if @house.update(house_params)
      @house.reload(includes: [ :utilities, images_attachments: :blob ])
      render json: @house, serializer: Landlord::Estate::HouseSerializer, status: :ok, host: request.base_url
    else
      render json: { errors: @house.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    if @house.destroy
      render json: { message: "House successfully deleted" }, status: :ok
    else
      render json: { errors: [ "Could not delete house" ] }, status: :bad_request
    end
  end

  private

  def set_estate
    @estate = current_user.landlord_profile.estates
                          .includes(image_attachment: :blob)
                          .find(params[:estate_id])
  end

  def set_house
    @house = @estate.houses
                    .includes(:utilities, images_attachments: :blob)
                    .find(params[:house_id])
  end

  def house_params
    params.require(:house).permit(
      :house_name,
      :house_type,
      :is_occupied,
      utilities_attributes: [ :id, :name, :meter_no, :last_reading, :_destroy ],
      images: []
    )
  end
end
