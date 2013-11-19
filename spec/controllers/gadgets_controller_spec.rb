require 'spec_helper'

describe GadgetsController do
  before { 3.times { FactoryGirl.create :gadget }}
  context 'GET index' do
    before { get :index }
    it 'assigns properly' do
      expect(assigns :gadgets).to eq Gadget.all
    end
  end
end
