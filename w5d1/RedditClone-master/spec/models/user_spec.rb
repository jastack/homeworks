require 'rails_helper'

RSpec.describe User, type: :model do

  subject(:user) { User.new(username: jdog, password: 123456) }

end

  describe 'validations' do
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_length_of(:password).is_at_least(6) }
  end

  describe 'associations' do
    it { should have_many(:comments) }
    it { should have_many(:posts) }
  end

  describe 'User#is_valid?' do
    expect(user.session_token).to_not be_nil
  end

  describe 'User#reset_session_token!' do

  end

  describe 'User::find_by_credentials' do

  end
