class HomeController < ApplicationController
  def index
  end

  def find_actors_movie
    page = params[:page] || 1
    movies = ApiConsumer::MovieDatabase.new.get_actors_movie(params[:term], page)
    render json: movies, status: 200
  rescue => e
    render json: {error: e}, status: 400
  end
end
