# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'people/show', type: :view do
  let(:email) { Faker::Internet.email }

  before do
    assign(:person, Person.create!(
                      name: 'Kraft',
                      email: email
                    ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Kraft/)
    expect(rendered).to match(/#{email}/)
  end
end
