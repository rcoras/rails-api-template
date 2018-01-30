class TripsController < ProtectedController
  before_action :set_trip, only: %i[show update destroy]

  # GET /trips
  def index
    # @trips = Trip.all
    @trips = current_user.trips.all

    render json: @trips
  end

  # GET /trips/1
  def show
    render json: Trip.find(params[:id])
  end

  # POST /trips
  def create
    @trip = current_user.trips.build(trip_params)

    if @trip.save
      render json: @trip, status: :created, location: @trip
    else
      render json: @trip.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /trips/1
  def update
    if @trip.update(trip_params)
      render json: @trip
    else
      render json: @trip.errors, status: :unprocessable_entity
    end
  end

  # DELETE /trips/1
  def destroy
    # binding.pry

    @trip.destroy

    head :no_content
  end

    # Use callbacks to share common setup or constraints between actions.
    def set_trip
      # binding.pry
      @trip = current_user.trips.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def trip_params
      params.require(:trip).permit(:trip_date, :trip_length_hrs, :location, :no_of_fish_caught, :comments)
    end

    private :set_trip, :trip_params
end
