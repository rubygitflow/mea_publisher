# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/people', type: :request do
  let(:valid_attributes) do
    {
      name: 'Gecko',
      nickname: Faker::Internet.unique.username(specifier: 8),
      email: Faker::Internet.email
    }
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      person = Person.create! valid_attributes
      get person_url(person)
      expect(response).to be_successful
    end
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      Person.create! valid_attributes
      get people_url
      expect(response).to be_successful
    end
  end
end
