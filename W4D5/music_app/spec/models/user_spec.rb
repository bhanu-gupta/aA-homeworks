require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password_digest).with_message('Password cant be blank') }
  it { should validate_presence_of(:session_token) }
  it { should validate_length_of(:password).is_at_least(6).allow_nil}

  let!(:user1) {
        User.create!(
          email: 'guptabhanu90@gmail.com',
          password_digest: BCrypt::Password.create('abcdefg'),
          session_token: User.generate_session_token
        )
      }

  describe '::find_by_credentials' do
    it "has the correct values hash" do
      expect(User.find_by_credentials(user1.email, 'abcdefg').where_values_hash).to eq({'email' => user1.email})
    end
    it "should return a valid user" do
      expect(User.find_by_credentials(user1.email, 'abcdefg')).to eq(user1)
    end
    it "should return nil if invalid user" do 
      expect(User.find_by_credentials(user1.email, 'abcdefgh')).to be_nil
    end

  end

  describe '#reset_session_token!' do
    it "should return a new session token" do
      current_session_token = user1.session_token
      expect(user1.reset_session_token!).not_to eq(current_session_token)
    end
    it "should save the new session token to the database" do
      user1.reset_session_token!
      expect(User.find_by(:session_token => user1.session_token)).to_not be_nil
    end
  end

  describe '#is_password?' do
    it "should call the bcrypt is_password to check for correct password"
    it "should return true in case of valid password"
    it "should return false in case of invalid password"
  end

end
