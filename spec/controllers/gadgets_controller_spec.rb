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
    it 'renders index' do
      expect(response).to render_template :index
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
    it 'renders show' do
      expect(response).to render_template :show
    end
  end

  context 'GET new' do
    before { get :new }
    it 'is success' do
      expect(response).to be_success
    end
    it 'assigns properly' do
      expect(assigns(:gadget).new_record?).to be_true
    end
    it 'renders new' do
      expect(response).to render_template :new
    end
  end

  context 'POST create' do
    let(:user) { FactoryGirl.create :user }
    let(:attributes) {{ name: 'ipod', user_id: user.id }}
    let(:gadget) { Gadget.last }
    before { post :create, gadget: attributes }
    it 'is creates gadget' do
      expect(gadget.new_record?).not_to be_true
    end
    it 'renders show' do
      expect(response).to redirect_to gadget_path(gadget)
    end
  end

  context 'GET edit' do
    let(:gadget) { FactoryGirl.create :gadget }
    before { get :edit, id: gadget.id }
    it 'is success' do
      expect(response).to be_success
    end
    it 'assigns properly' do
      expect(assigns :gadget).to eq gadget
    end
    it 'renders edit' do
      expect(response).to render_template :edit
    end
  end

  context 'POST update' do
    let(:gadget) { FactoryGirl.create :gadget }
    let(:attributes) {{name: 'ipod'}}
    before { post :update, id: gadget.id, gadget: attributes }
    it 'is updates gadget' do
      expect(gadget.reload.name).to eq attributes[:name]
    end
    it 'renders show' do
      expect(response).to redirect_to gadget_path(gadget)
    end
  end

  context 'POST destroy' do
    let(:gadget) { FactoryGirl.create :gadget }
    before { post :destroy, id: gadget.id }
    it 'is destroys gadget' do
      expect(Gadget.count).to eq 3
    end
    it 'renders show' do
      expect(response).to redirect_to gadgets_path
    end
  end
end
