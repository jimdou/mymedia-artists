class SimilarArtistsController < ApplicationController
  before_action :set_similar_artist, only: [:show, :edit, :update, :destroy]

  # GET /similar_artists
  # GET /similar_artists.json
  def index
    @similar_artists = SimilarArtist.all
  end

  # GET /similar_artists/1
  # GET /similar_artists/1.json
  def show
  end

  # GET /similar_artists/new
  def new
    @similar_artist = SimilarArtist.new
  end

  # GET /similar_artists/1/edit
  def edit
  end

  # POST /similar_artists
  # POST /similar_artists.json
  def create
    @similar_artist = SimilarArtist.new(similar_artist_params)

    respond_to do |format|
      if @similar_artist.save
        format.html { redirect_to @similar_artist, notice: 'Similar artist was successfully created.' }
        format.json { render :show, status: :created, location: @similar_artist }
      else
        format.html { render :new }
        format.json { render json: @similar_artist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /similar_artists/1
  # PATCH/PUT /similar_artists/1.json
  def update
    respond_to do |format|
      if @similar_artist.update(similar_artist_params)
        format.html { redirect_to @similar_artist, notice: 'Similar artist was successfully updated.' }
        format.json { render :show, status: :ok, location: @similar_artist }
      else
        format.html { render :edit }
        format.json { render json: @similar_artist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /similar_artists/1
  # DELETE /similar_artists/1.json
  def destroy
    @similar_artist.destroy
    respond_to do |format|
      format.html { redirect_to similar_artists_url, notice: 'Similar artist was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_similar_artist
      @similar_artist = SimilarArtist.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def similar_artist_params
      params.require(:similar_artist).permit(:name, :description, :genre, :image, :birthDate, :deathDate, :activeFrom, :activeUntil, :artist_id)
    end
end
