require 'rails_helper'
describe User do

  describe '#create' do
	it "is invalid without a nickname" do
	 user = build(:user, nickname: "")
	 user.valid?
	 expect(user.errors[:nickname]).to include("can't be blank")
	end

    it "is invald without a email" do
     user = build(:user, email: "")
     user.valid?
     expect(user.errors[:email]).to include("can't be blank")
    end

    it "is invalid with a duplicate email" do
    	user1 = build(:user, email: "kazuki@gmail.com")
    	user2 = build(:user, email: "kazuki@gmail.com")
    	expect(user2).to be_valid
    end

    it "is invalid without a password_confirmation" do
    	user = build(:user, password: "00000000", password_confirmation: "00000000")
    	expect(user).to be_valid
    end

    

  end
end
