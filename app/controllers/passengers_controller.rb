class PassengersController < ApplicationController

  def index
    @passengers = Passenger.all
  end

  def show
    @passenger = Passenger.find(params[:id])
  end

  def new
    @passenger = Passenger.new
  #   if @passenger.too_young? do
  #     redirect_to 'new'
  #   end
  end

  def create
    @passenger = Passenger.new(passenger_params)

    if @passenger.save
       redirect_to @passenger
    end
  end

  def edit
    @passengers = Passenger.find(params[:id])
  end

  def update
    @passengers = Passenger.find(params[:id])
    if @passengers.update( passenger_params )
     redirect_to @passengers
    else
     render 'edit'
    end
  end

  def destroy
    @passengers = Passenger.find(params[:id])

    @passengers.destroy

    redirect_to passengers_path
  end

  private

  def passenger_params
    params.require(:passenger).permit(:name, :age, :gender, :car_id)
  end

end
