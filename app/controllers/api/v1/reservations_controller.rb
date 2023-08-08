class Api::V1::ReservationsController < ApplicationController
  before_action :authenticate_user!

  # GET /api/v1/reservations
  def index
    @reservations = if current_user.admin?
                      Reservation.all
                    else
                      current_user.reservations
                    end
    render json: @reservations
  end

  # POST /api/v1/studios/:studio_id/reservations
  def create
    @reservation = current_user.reservations.new(reservation_params)
    @reservation.studio = Studio.find(params[:studio_id])

    if @reservation.save
      render json: @reservation, status: :created
    else
      render json: @reservation.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/studios/:studio_id/reservations/:id
  def destroy
    @reservation = Reservation.find(params[:id])
    if current_user.id.eql?(@reservation.user_id) || current_user.admin?
      @reservation.destroy
      
      render json: @reservation
    else
      render json: { error: 'You are not authorized to delete this reservation' }, status: :unauthorized
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:reservation_date, :location)
  end
end
