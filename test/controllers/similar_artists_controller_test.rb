require 'test_helper'

class SimilarArtistsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @similar_artist = similar_artists(:one)
  end

  test "should get index" do
    get similar_artists_url
    assert_response :success
  end

  test "should get new" do
    get new_similar_artist_url
    assert_response :success
  end

  test "should create similar_artist" do
    assert_difference('SimilarArtist.count') do
      post similar_artists_url, params: { similar_artist: { activeFrom: @similar_artist.activeFrom, activeUntil: @similar_artist.activeUntil, artist_id: @similar_artist.artist_id, birthDate: @similar_artist.birthDate, deathDate: @similar_artist.deathDate, description: @similar_artist.description, genre: @similar_artist.genre, image: @similar_artist.image, name: @similar_artist.name } }
    end

    assert_redirected_to similar_artist_url(SimilarArtist.last)
  end

  test "should show similar_artist" do
    get similar_artist_url(@similar_artist)
    assert_response :success
  end

  test "should get edit" do
    get edit_similar_artist_url(@similar_artist)
    assert_response :success
  end

  test "should update similar_artist" do
    patch similar_artist_url(@similar_artist), params: { similar_artist: { activeFrom: @similar_artist.activeFrom, activeUntil: @similar_artist.activeUntil, artist_id: @similar_artist.artist_id, birthDate: @similar_artist.birthDate, deathDate: @similar_artist.deathDate, description: @similar_artist.description, genre: @similar_artist.genre, image: @similar_artist.image, name: @similar_artist.name } }
    assert_redirected_to similar_artist_url(@similar_artist)
  end

  test "should destroy similar_artist" do
    assert_difference('SimilarArtist.count', -1) do
      delete similar_artist_url(@similar_artist)
    end

    assert_redirected_to similar_artists_url
  end
end
