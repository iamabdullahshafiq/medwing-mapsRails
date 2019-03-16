# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Location', type: :request do
  let(:location_params) do
    {
      location: {
        title: Faker::Nation.unique.capital_city,
        description: Faker::Lorem.unique.sentence,
        latitude: Faker::Number.unique.decimal(2),
        longitude: Faker::Number.unique.decimal(2)
      }
    }
  end

  let(:location_invalid_params) do
    {
      location: {
        title: nil,
        description: Faker::Lorem.unique.sentence,
        latitude: Faker::Number.unique.decimal(2),
        longitude: Faker::Number.unique.decimal(2)
      }
    }
  end

  describe 'POST /v1/locations' do
    context 'params are blank' do
      let(:location_blank_params) do
        {
          location: {}
        }
      end

      before(:each) do
        post '/v1/locations', params: location_blank_params
      end

      it 'returns 422 status' do
        expect(response).to have_http_status(422)
      end

      it 'returns errors' do
        expect_error('Title can\'t be blank')
        expect_error('Longitude can\'t be blank')
        expect_error('Latitude can\'t be blank')
        expect_error('Latitude is not a number')
        expect_error('Longitude is not a number')
      end
    end

    context 'params are invalid' do
      before(:each) do
        post '/v1/locations', params: location_invalid_params
      end

      it 'returns 422 status' do
        expect(response).to have_http_status(422)
      end

      it 'returns errors' do
        expect_error('Title can\'t be blank')
      end
    end

    context 'params are valid' do
      before(:each) do
        post '/v1/locations', params: location_params
      end

      it 'returns 200 status' do
        expect(response).to have_http_status(200)
      end

      it 'returns a new location' do
        longitude_value = location_params[:location][:longitude].to_f
        latitude_value = location_params[:location][:latitude].to_f

        expect(json['title']).to match(location_params[:location][:title])
        expect(json['description']).to match(location_params[:location][:description])
        expect(json['longitude']).to match(longitude_value)
        expect(json['latitude']).to match(latitude_value)
      end
    end
  end
end
