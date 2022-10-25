class SpicesController < ApplicationController

wrap_parameters format: {}

  def index
    spice = Spice.all
    render json: spice
  end

  def show
    spice = Spice.find_by(id: params[:id])
    render json: spice
  end 

  def create
    spice = Spices.create(spice_params)
    render json: spice, status: :created
  end

  def update
    spice = Spice.find_by(id: params[:id])
    if spice
      spice.update(spice_params)
      render json: spice, status: :accepted
    else
      render json: {error: "spice_not_found"}, status: :not_found
    end
  end
  
  def destroy
    spice = Spice.find_by(id: params[:id])
    if spice
      spice.destroy
      head :no_content
    else 
      render json: { error: "Spice not found "}, status: not_found
    end
  end

  private

  def spice_params
    params.permit(:title, :description, :notes, :rating)
  end

end
