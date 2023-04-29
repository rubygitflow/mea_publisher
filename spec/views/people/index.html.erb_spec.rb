# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'people/index', type: :view do
  let(:email1) { Faker::Internet.email }
  let(:email2) { Faker::Internet.email }
  let(:person) { Person.create!(name: 'Porter') }

  before do
    assign(:people, [
             Person.create!(
               name: 'Kraft',
               email: email1
             ),
             Person.create!(
               name: 'Kraft',
               email: email2
             )
           ])
  end

  it 'renders a list of people' do
    allow(@person).to receive(:name)
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new('Kraft'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(email1), count: 1
    assert_select cell_selector, text: Regexp.new(email2), count: 1
  end
end
