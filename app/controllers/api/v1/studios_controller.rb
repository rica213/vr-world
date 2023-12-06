class Api::V1::StudiosController < ApplicationController
  before_action :authenticate_user!, only: %i[create destroy]
  before_action :set_studio, only: %i[show destroy]

  # GET /api/v1/studios
  def index
    @studios = Studio.all

    render json: @studios
  end

  # GET /api/v1/studios/:id
  def show
    render json: @studio
  end

  # POST /api/v1/studios
  def create
    @user = current_user
    if @user.admin?
      @studio = @user.studios.new(studio_params)

      if @studio.save
        render json: @studio, status: :created
      else
        render json: @studio.errors, status: :unprocessable_entity
      end
    else
      render json: { error: 'You are not authorized to create a studio' }, status: :unauthorized
    end
  end

  # DELETE /api/v1/studios/:id
  def destroy
    if current_user.admin?
      @studio.destroy
    else
      render json: { error: 'You are not authorized to delete a studio' }, status: :unauthorized
    end
  end

  def update
    @studio = Studio.find(params[:id])

    if current_user.admin? || current_user.id.eql?(@studio.user_id)
      if @studio.update(studio_params)
        render json: @studio
      else
        render json: @studio.errors, status: :unprocessable_entity
      end
    else
      render json: { error: 'You are not authorized to update a studio' }, status: :unauthorized
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_studio
    @studio = Studio.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def studio_params
    params.require(:studio).permit(:name, :description, :price, :duration, :location, :working_hours, :image_url,
                                   :contact)
  end
end
