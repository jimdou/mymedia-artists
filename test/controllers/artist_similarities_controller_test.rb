require 'test_helper'

class ArtistSimilaritiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @artist_similarity = artist_similarities(:one)
  end

  test "should get index" do
    get artist_similarities_url
    assert_response :success
  end

  test "should get new" do
    get new_artist_similarity_url
    assert_response :success
  end

  test "should create artist_similarity" do
    assert_difference('ArtistSimilarity.count') do
      post artist_similarities_url, params: { artist_similarity: { artist_id: @artist_similarity.artist_id, similar_artist_id: @artist_similarity.similar_artist_id } }
    end

    assert_redirected_to artist_similarity_url(ArtistSimilarity.last)
  end

  test "should show artist_similarity" do
    get artist_similarity_url(@artist_similarity)
    assert_response :success
  end

  test "should get edit" do
    get edit_artist_similarity_url(@artist_similarity)
    assert_response :success
  end

  test "should update artist_similarity" do
    patch artist_similarity_url(@artist_similarity), params: { artist_similarity: { artist_id: @artist_similarity.artist_id, similar_artist_id: @artist_similarity.similar_artist_id } }
    assert_redirected_to artist_similarity_url(@artist_similarity)
  end

  test "should destroy artist_similarity" do
    assert_difference('ArtistSimilarity.count', -1) do
      delete artist_similarity_url(@artist_similarity)
    end

    assert_redirected_to artist_similarities_url
  end
end
