require 'spec_helper'

describe User do
  context "::create" do
    context "with valid attributes" do
      let(:user) { FactoryGirl.build :user }
      it "is valid" do
        expect(user.valid?).to be_true
      end
    end
    context "when using taken email" do
      before { FactoryGirl.create :user }
      let(:user) { FactoryGirl.build :user, email: User.last.email }
      it "is invalid" do
        expect(user.valid?).to be_false
        expect(user.errors[:email]).not_to be_empty
      end
    end
  end
end
