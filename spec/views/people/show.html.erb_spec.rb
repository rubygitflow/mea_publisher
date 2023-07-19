# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'people/show', type: :view do
  let(:email) { Faker::Internet.email }
  let(:nickname) { Faker::Internet.unique.username(specifier: 8) }

  before do
    assign(:person, Person.create!(
                      name: 'Kraft',
                      nickname: nickname,
                      email: email,
                      password: '12345678'
                    ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Kraft/)
    expect(rendered).to match(/#{email}/)
    expect(rendered).to match(/#{nickname}/)
  end
end
