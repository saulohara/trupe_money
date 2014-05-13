require "spec_helper"

describe User do
	
	before(:each) do
    @user = FactoryGirl.build(:user, :marcio)
  end

	it "validates presence of name" do
		@user.should validate_presence_of :name
	end

	it "validates presence of email" do
		@user.should validate_presence_of :email
	end

end