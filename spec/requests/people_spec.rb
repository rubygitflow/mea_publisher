# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/people', type: :request do
  let(:valid_attributes) do
    {
      name: 'Gecko'
    }
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      person = Person.create! valid_attributes
      get root_url(person)
      expect(response).to be_successful
    end
  end
end
