# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/people', type: :request do
  let(:valid_attributes) do
    {
      name: 'Gecko',
      nickname: Faker::Internet.unique.username(specifier: 8),
      email: Faker::Internet.email,
      password: '12345678'
    }
  end

  let(:invalid_attributes) do
    {
      title: 'Gecko',
      nickname: '',
      email: '',
      password: '12345678'
    }
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      params = {
        session: {
          email: valid_attributes[:email],
          password: '12345678'
        }
      }
      do_request(:post, session_path, params)

      person = Person.create! valid_attributes
      get person_url(person)
      expect(response).to be_successful
    end
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      Person.create! valid_attributes
      params = {
        session: {
          email: valid_attributes[:email],
          password: '12345678'
        }
      }
      do_request(:post, session_path, params)

      get people_url
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_person_url
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Person' do
        expect do
          post people_url, params: { person: valid_attributes }
        end.to change(Person, :count).by(1)
      end

      it 'redirects to the root page' do
        post people_url, params: { person: valid_attributes }
        expect(response).to redirect_to(root_url)
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Person' do
        expect do
          post people_url, params: { person: invalid_attributes }
        end.to change(Person, :count).by(0)
      end

      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post people_url, params: { person: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'GET /edit' do
    it 'renders a successful response' do
      person = Person.create!(valid_attributes)

      get edit_person_url(person)
      expect(response).to be_successful
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        {
          name: 'Gecko',
          nickname: Faker::Internet.unique.username(specifier: 8),
          email: Faker::Internet.email,
          password: '12345678'
        }
      end

      it 'updates the requested person' do
        person = Person.create!(valid_attributes)

        patch person_url(person), params: { person: new_attributes }
        person.reload
        expect(person.nickname).to eq(new_attributes[:nickname])
        expect(person.email).to eq(new_attributes[:email])
      end

      it 'redirects to the person page' do
        person = Person.create!(valid_attributes)

        patch person_url(person), params: { person: new_attributes }
        person.reload
        expect(response).to redirect_to(person_url(person))
      end
    end

    context 'with invalid parameters' do
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        person = Person.create!(valid_attributes)

        patch person_url(person), params: { person: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
