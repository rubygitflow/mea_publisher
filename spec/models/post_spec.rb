# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'associations' do
    it { is_expected.to respond_to :person_id }
    it { is_expected.to belong_to :person }
  end

  describe 'send email notification after create' do
    let(:person) do
      Person.create!(
        name: 'Kraft',
        email: Faker::Internet.email
      )
    end
    let(:post) do
      post = described_class.new(
        title: 'MyString',
        person:,
        body: 'MyText'
      )
      post.current_user = person
      post
    end

    it 'calls PostNotificationJob' do
      expect(PostNotificationJob).to receive(:perform_later).with(post)
      post.save!
    end
  end
end
