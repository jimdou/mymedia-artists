class ArtistsController < ApplicationController
  before_action :set_artist, only: [:show, :edit, :update, :destroy]

  # GET /artists
  # GET /artists.json
  def index
    @artists = Artist.all
  end

  # GET /artists/1
  # GET /artists/1.json
  def show

    # http://ws.audioscrobbler.com/2.0/?method=artist.getsimilar&artist=cher&api_key=98eb1de341bb8867330d52e277726f6a&format=json

    require 'net/http'
    require 'json'

    uri = URI('http://ws.audioscrobbler.com/2.0/')
    params = {
      :method => 'artist.getsimilar',
      :artist => @artist.name,
      :api_key => '649104dbc970cbc72a343fa37daaab71',
      :format => 'json'
    }
    uri.query = URI.encode_www_form(params)

    res = Net::HTTP.get_response(uri)
    # puts res.body if res.is_a?(Net::HTTPSuccess)
    content = JSON.parse(res.body) if res.is_a?(Net::HTTPSuccess)

    logger.debug "content"
    logger.debug content


    # logger.debug "content.similarartists"
    # logger.debug content.similarartists

    @content = content

    # @artist.similar_artists_lastfm = content.similarartists.artist
    @similar_artists_lastfm = content["similarartists"]["artist"]


  end

  # GET /artists/new
  def new
    @artist = Artist.new
  end

  # GET /artists/1/edit
  def edit
  end

  # POST /artists
  # POST /artists.json
  def create
    @artist = Artist.new(artist_params)

    respond_to do |format|
      if @artist.save
        format.html { redirect_to @artist, notice: 'Artist was successfully created.' }
        format.json { render :show, status: :created, location: @artist }
      else
        format.html { render :new }
        format.json { render json: @artist.errors, status: :unprocessable_entity }
      end
    end
  end



  # POST /random
  # POST /random.json
  def random
    limit = limit_params[:limit]
    @artists = Artist.order("RANDOM()").limit(limit)
  end





  # PATCH/PUT /artists/1
  # PATCH/PUT /artists/1.json
  def update
    respond_to do |format|
      if @artist.update(artist_params)
        format.html { redirect_to @artist, notice: 'Artist was successfully updated.' }
        format.json { render :show, status: :ok, location: @artist }
      else
        format.html { render :edit }
        format.json { render json: @artist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /artists/1
  # DELETE /artists/1.json
  def destroy
    @artist.destroy
    respond_to do |format|
      format.html { redirect_to artists_url, notice: 'Artist was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_artist
      @artist = Artist.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def artist_params
      params.require(:artist).permit(:name, :description, :genre, :image, :birthDate, :deathDate, :activeFrom, :activeUntil)
    end

    def limit_params
      params.permit(:limit)
    end
end
