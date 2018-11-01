class SongsController < ApplicationController
  set :views, "app/views/songs"

  get '/songs' do
    @songs = Song.all
    erb :index
  end

  get '/songs/new' do
    @artists = Artist.all
    @genres = Genre.all
    erb :new
  end

  post '/songs' do
    name = params[:name]
    artist_id = params[:artist]
    artist = Artist.find(artist_id)
    song = Song.create(name: name, artist: artist)
    redirect "/songs/#{song.slug}"
  end

  get "/songs/:slug" do
    @songs = Song.find(params[:slug])
    erb :show
  end
end
