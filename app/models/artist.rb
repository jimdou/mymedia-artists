class Artist < ApplicationRecord

  has_many :artist_similarities
  has_many :similar_artists, through: :artist_similarities




  def similar_artists_lastfm

    @similar_artists_lastfm = []

    require 'net/http'
    require 'json'

    uri = URI('http://ws.audioscrobbler.com/2.0/')
    params = {
      :method => 'artist.getsimilar',
      :artist => self.name,
      :api_key => '649104dbc970cbc72a343fa37daaab71',
      :format => 'json'
    }
    uri.query = URI.encode_www_form(params)
    res = Net::HTTP.get_response(uri)
    content = JSON.parse(res.body) if res.is_a?(Net::HTTPSuccess)
    @similar_artists_lastfm = content["similarartists"]["artist"]

  end





end
