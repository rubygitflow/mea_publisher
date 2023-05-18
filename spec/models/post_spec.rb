# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'associations' do
    it { is_expected.to respond_to :person_id }
    it { is_expected.to belong_to :person }
  end

  describe 'validations' do
    # https://matchers.shoulda.io/docs/v5.3.0/Shoulda/Matchers/ActiveRecord.html#validate_uniqueness_of-instance_method
    it { is_expected.to validate_presence_of(:body) }
    it { is_expected.to validate_length_of(:body).is_at_least(1) }
  end

  describe 'send email notification after create' do
    let(:person) do
      Person.create!(
        name: 'Kraft',
        nickname: Faker::Internet.unique.username(specifier: 8),
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
