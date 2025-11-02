class IocsController < ApplicationController
  allow_unauthenticated_access only: %i[ index show ]
  before_action :set_ioc, only: %i[ show edit update destroy ]
  def index
    @iocs = Ioc.all
  end

  def show
  end

  def new
    @ioc = Ioc.new
  end

  def create
    @ioc = Ioc.new(ioc_params.merge(source: "public"))
    if @ioc.save
      redirect_to @ioc
    else render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @ioc.update(ioc_params)
      redirect_to @ioc
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @ioc.destroy
    redirects_to iocs_path
  end

  private
  def set_ioc
    @ioc = Ioc.find(params[:id])
  end

  private
  def ioc_params
    params.expect(ioc: [ :ioc_type, :value, :first_seen ])
  end
end
