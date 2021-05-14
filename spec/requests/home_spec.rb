require 'rails_helper'

RSpec.describe "/home", type: :request do

  let(:valid_term) do
    {term: Faker::Movie.title}
  end

  let(:valid_term_minimum) do
    {term: ''.ljust(GlobalConstants::MINIMUM_TERM_SIZE, 's')}
  end

  let(:valid_term_maximum) do
    {term: ''.ljust(GlobalConstants::MAXIMUM_TERM_SIZE, 's')}
  end

  let(:term_empty) do
    {term: ''}
  end

  let(:without_term_param) do
    {term: ''}
  end

  let(:invalid_term_minimum) do
    {term: ''.ljust(GlobalConstants::MINIMUM_TERM_SIZE-1, 's')}
  end

  let(:invalid_term_maximum) do
    {term: ''.ljust(GlobalConstants::MAXIMUM_TERM_SIZE+1, 's')}
  end

  describe "GET /index" do
    it 'renders a successful response' do
      get home_index_path
      expect(response).to be_successful
    end
  end

  describe 'GET /find_actors_movie' do
    context 'with valid parameters' do
      it 'renders a successful response' do
        get home_find_actors_movie_path(valid_term)
        expect(response).to have_http_status(200)
      end

      it 'renders a successful response (minimum size)' do
        get home_find_actors_movie_path(valid_term_minimum)
        expect(response).to have_http_status(200)
      end

      it 'renders a successful response (maximum size)' do
        get home_find_actors_movie_path(valid_term_maximum)
        expect(response).to have_http_status(200)
      end
    end

    context 'with invalid parameters' do
      it 'renders a bad request response (term empty)' do
        get home_find_actors_movie_path(term_empty)
        expect(response).to have_http_status(400)
      end

      it 'renders a bad request response (without term)' do
        get home_find_actors_movie_path(without_term_param)
        expect(response).to have_http_status(400)
      end

      it 'renders a bad request response (minimum size invalid)' do
        get home_find_actors_movie_path(invalid_term_minimum)
        expect(response).to have_http_status(400)
      end

      it 'renders a bad request response (maximum size invalid)' do
        get home_find_actors_movie_path(invalid_term_maximum)
        expect(response).to have_http_status(400)
      end
    end
  end
end
