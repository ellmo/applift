require 'spec_helper'

describe Gadget do
  context "::create" do
    context "with valid attributes" do
      let(:gadget) { FactoryGirl.build :gadget }
      it "is valid" do
        expect(gadget.valid?).to be_true
      end
    end
    context "without user" do
      let(:gadget) { FactoryGirl.build :gadget, user: nil }
      it "is invalid" do
        expect(gadget.valid?).to be_false
      end
    end
  end
end
