class GadgetsController < ApplicationController

  before_filter :get_gadgets, only: [:index]
  before_filter :get_gadget, only: [:show, :edit, :update]

  def index; end

  def show; end

  def new
    @gadget = Gadget.new
  end

  def create
    @gadget = Gadget.new(params[:gadget])
    if @gadget.save
      redirect_to @gadget
    else
      render action: :new, notice: 'error'
    end
  end

  def edit; end

  def update
    if @gadget.update_attributes(params[:gadget])
      redirect_to @gadget
    else
      render action: :edit, notice: 'error'
    end
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
