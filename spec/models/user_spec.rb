require 'rails_helper'

RSpec.describe User, type: :model do

  let(:password) { "password" }
  let(:email) { "test@test.com" }

  describe "Validation" do

    it "fails if passwords don't match" do
      password = "password"
      @user = User.new(first_name: "name", last_name: "name", email: email, password: password, password_confirmation: "not a match");
      expect(@user).not_to be_valid
    end

    it "is valid when passwords match" do 
      password = "password"
      @user = User.new(first_name: "name", last_name: "name", email: email, password: password, password_confirmation: password);
      expect(@user).to be_valid
    end

    it "is not valid when two users have same email" do 
      password = "password"
      @user1 = User.create(first_name: "name", last_name: "name", email: email, password: password, password_confirmation: password);
      @user2 = User.new(first_name: "name", last_name: "name", email: "test@TEst.com", password: password, password_confirmation: password);
      expect(@user2).not_to be_valid
    end

    it "is not valid when password is less than 2 char long" do 
      password = "p"
      @user = User.new(first_name: "name", last_name: "name", email: email, password: password, password_confirmation: password);
      expect(@user).not_to be_valid
    end
  end
  describe '.authenticate_with_credentials' do
    it "returns a user when authenticated correctly" do 
      @user = User.create(first_name: "name", last_name: "name", email: email, password: password, password_confirmation: password)
      @authenticateUser = User.authenticate_with_credentials(email, password)
      expect(@authenticateUser).not_to be_nil
    end
    it "returns a nil when not authenticated" do 
      @user = User.create(first_name: "name", last_name: "name", email: email, password: password, password_confirmation: password)
      @authenticateUser = User.authenticate_with_credentials(email, "not_a_password")
      expect(@authenticateUser).to be_nil
    end
    it "returns a user when authenticated with an email with spaces" do 
      @user = User.create(first_name: "name", last_name: "name", email: email, password: password, password_confirmation: password)
      @authenticateUser = User.authenticate_with_credentials("   #{email}", password)
      expect(@authenticateUser).not_to be_nil 
    end
    it "returns a user when authenticated with mixed case email" do 
      @user = User.create(first_name: "name", last_name: "name", email: email, password: password, password_confirmation: password)
      @authenticateUser = User.authenticate_with_credentials("TeSt@tEst.com", password)
      expect(@authenticateUser).not_to be_nil 
    end
  end
end
