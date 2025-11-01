class IocsController < ApplicationController
  def index
    @iocs = Ioc.all
  end

  def show
    @ioc = Ioc.find(params[:id])
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

  private
  def ioc_params
    params.expect(ioc: [ :ioc_type, :value, :first_seen ])
  end
end
