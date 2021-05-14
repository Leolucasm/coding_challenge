class ApiConsumer::MovieDatabase # https://developers.themoviedb.org/3
  require 'cgi'

  def get_actors_movie(term, page=1)
    raise t('messages.word_size_invalid') unless term_is_valid?(term)
    movies = search_movies(term, page)
    list = {}

    if movies.present?
      list[:page] = movies["page"]
      list[:total_pages] = movies["total_pages"]
      list[:results] = []

      movies["results"].each do |movie|
        main_actor = get_main_actor_movie(movie["id"], list[:results])
        next unless main_actor.present?
        list[:results] << main_actor
      end
    end
    return list
  end

  def get_main_actor_movie(movie_id, list=nil)
    actors_movie = search_movie_credits(movie_id)
    main_actor = actors_movie["cast"][0] if actors_movie.present? && actors_movie["cast"].present?

    return unless main_actor.present?
    return if list.present? && list.to_s.include?(main_actor["name"])

    return {
      name: main_actor["name"],
      photo: "https://image.tmdb.org/t/p/w500#{main_actor['profile_path']}",
      know_for: get_main_movies_actor(main_actor["name"])
    }
  end

  def get_main_movies_actor(actor_name)
    person_detail = search_actors(actor_name)

    return unless person_detail["results"].present?

    movies = []
    person_detail["results"][0]["known_for"].each do |cast|
      movies << cast["title"] if cast.present? && cast["title"].present?
    end
    return movies
  end

  # API Searchs
  def search_movies(term, page=1)
    result = get "search/movie?query=#{term}&page=#{page}"
  end

  def search_actors(term, page=1)
    result = get "search/person?query=#{CGI.escape(term)}&page=#{page}"
  end

  def search_movie_credits(movie_id)
    result = get "/movie/#{movie_id}/credits?"
  end

  private

  def term_is_valid?(term)
    term.present? && term.size >= GlobalConstants::MINIMUM_TERM_SIZE && term.size <= GlobalConstants::MAXIMUM_TERM_SIZE
  end

  def get(path)
    response = RestClient.get get_url(path), default_headers
    return JSON.parse(response.body)
  end

  def default_headers
    {content_type: 'application/json;charset=utf-8'}
  end

  def get_url(path)
    "https://api.themoviedb.org/3/#{path}&api_key=#{ENV['MOVIE_DATABASE_TOKEN']}&language=#{I18n.locale.to_s}"
  end
end
