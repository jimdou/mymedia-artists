class ArtistSimilaritiesController < ApplicationController
  before_action :set_artist_similarity, only: [:show, :edit, :update, :destroy]

  # GET /artist_similarities
  # GET /artist_similarities.json
  def index
    @artist_similarities = ArtistSimilarity.all
  end

  # GET /artist_similarities/1
  # GET /artist_similarities/1.json
  def show
  end

  # GET /artist_similarities/new
  def new
    @artist_similarity = ArtistSimilarity.new
  end

  # GET /artist_similarities/1/edit
  def edit
  end

  # POST /artist_similarities
  # POST /artist_similarities.json
  def create
    @artist_similarity = ArtistSimilarity.new(artist_similarity_params)

    respond_to do |format|
      if @artist_similarity.save
        format.html { redirect_to @artist_similarity, notice: 'Artist similarity was successfully created.' }
        format.json { render :show, status: :created, location: @artist_similarity }
      else
        format.html { render :new }
        format.json { render json: @artist_similarity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /artist_similarities/1
  # PATCH/PUT /artist_similarities/1.json
  def update
    respond_to do |format|
      if @artist_similarity.update(artist_similarity_params)
        format.html { redirect_to @artist_similarity, notice: 'Artist similarity was successfully updated.' }
        format.json { render :show, status: :ok, location: @artist_similarity }
      else
        format.html { render :edit }
        format.json { render json: @artist_similarity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /artist_similarities/1
  # DELETE /artist_similarities/1.json
  def destroy
    @artist_similarity.destroy
    respond_to do |format|
      format.html { redirect_to artist_similarities_url, notice: 'Artist similarity was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_artist_similarity
      @artist_similarity = ArtistSimilarity.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def artist_similarity_params
      params.require(:artist_similarity).permit(:artist_id, :similar_artist_id)
    end
end
