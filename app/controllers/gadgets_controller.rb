class GadgetsController < ApplicationController

  before_filter :get_gadgets, only: [:index]
  before_filter :get_gadget, only: [:show, :new, :edit]

  def index; end

  def show; end

  def new ;end

  def create
  end

  def edit ;end

  def update
  end

  def destroy
  end

  def search
  end

private
  def get_gadgets
    @gadgets = Gadget.all
  end

  def get_gadget
    @gadget = Gadget.find params[:id]
  end
end
