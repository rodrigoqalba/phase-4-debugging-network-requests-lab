class ToysController < ApplicationController
  wrap_parameters format: []

  def index
    toys = Toy.all
    render json: toys
  end

  def create
    toy = Toy.create(toy_params)
    render json: toy, status: :created
  end

  def update
    toy = find_toy
    toy.update(toy_params)
    render json: toy, status: :ok
  end

  def destroy
    toy = find_toy
    toy.destroy
    head :no_content
  end

  private
  
  def toy_params
    params.permit(:name, :image, :likes)
  end

  def find_toy
    Toy.find_by(id: params[:id])
  end
  

end
