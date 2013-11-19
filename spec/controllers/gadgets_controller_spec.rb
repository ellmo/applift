require 'spec_helper'

describe GadgetsController do
  before { 3.times { FactoryGirl.create :gadget }}
  let(:gadget) { Gadget.last }

  context 'GET index' do
    before { get :index }
    it 'is success' do
      expect(response).to be_success
    end
    it 'assigns properly' do
      expect(assigns :gadgets).to eq Gadget.all
    end
  end

  context 'GET show' do
    before { get :show, id: gadget.id }
    it 'is success' do
      expect(response).to be_success
    end
    it 'assigns properly' do
      expect(assigns :gadget).to eq gadget
    end
  end
end
