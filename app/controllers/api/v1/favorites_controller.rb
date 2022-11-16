class Api::V1::FavoritesController < ApplicationController
  before_action :find_user

  def create
    favorite = @user.favorites.create(favorite_params)
    if favorite.save
      render json: { success: 'Favorite added successfully'}, status: 201
    else
      render json: @user.errors.messages, status: 400
    end
  end

private

  def find_user
    @user = User.find_by(api_key: params[:api_key])
    if !@user
      render json: { error: { details: 'That api key does not exist'} }, status: 404
    end
  end

  def favorite_params
    params.require(:favorite).permit(:api_key, :country, :recipe_link, :recipe_title)
  end
end