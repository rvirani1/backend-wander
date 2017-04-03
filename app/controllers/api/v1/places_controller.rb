class Api::V1::PlacesController < ApplicationController
  before_action :authenticate_user!

  def index
    @places = Place.all
    render json: @places, status: 200
  end

  def user_places
    user = User.find_by(email: params['email']) || @current_user
    @user_object = { places: user.places, favorites: user.favorites.joins(:place).select('places.lat as lat, places.lng as lng, places.name as name, favorites.*') }
    render json: @user_object, status: 200
  end

  def show
    @place = Place.find(params[:id])
    render json: {status: 200, feed: @place.comments, place: @place, images: @place.images, favorites: @place.favorites }
  end

  def favorited_places
    # @places = Place.joins(:favorite).order(;)
  end

  def favorited_user_places
    @user_object = { places: @current_user.places, favorites: @current_user.favorites.joins(:place).select('places.lat as lat, places.lng as lng, places.name as name, favorites.*') }
    render json: @user_object, status: 200
  end

  def create
    @place = Place.find_or_initialize_by(google_id: place_params[:google_id])
    @place.update_attributes(place_params) if !@place.persisted?
    @current_user.places.push(@place) if !@current_user.places.include?(@place)

    if params[:comment] && params[:comment].length > 0
      comment = @place.comments.build(user_id: @current_user.id, text: params[:comment].try(:strip))
      comment.save
    end
    Favorite.create(user_id: @current_user.id, place_id: @place.id) if params[:favorite]
    if params[:group]
      group_to_add_place = Group.find_by(id: params[:group][:id])
      group_to_add_place.places.push(@place) if !group_to_add_place.places.include?(@place)
    end
    if params[:image]
      @image = Image.new(place_id: @place.id, avatar: params[:image][:uri])
      @image.avatar_file_name = "#{@place.name}-#{SecureRandom.uuid}"
      @image.save
    end
    render json: @place, status: 201
  rescue => e
    render json: { status: 500 }
  end

  private
    def place_params
      params.require(:place).permit(:name, :lat, :lng, :google_id, :google_place_id, :city, :country, :group, :image => [:avatar])
    end

end
