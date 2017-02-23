class SongsController < ApplicationController

  def index
    @songs    = Song.all
    @currUser = currUser
  end

  def show
    @song     = Song.find(params[:id])
    @users    = List.where(song: @song)
    @currUser = currUser
  end

  def add
    #if song = Song.create(song_params)
    song = Song.new(song_params)
    if song.valid?
       song.save
    else
      #puts "\n\n\n #{song.errors.messages}\n\n\n"
      if song.errors.messages.key?(:artist)
        flash[:artist] = "The Artist name must be at least 2 characters in length."
      end
      if song.errors.messages.key?(:title)
        flash[:title] = "The Title must be at least 2 characters in length."
      end
    end
    redirect_to URL_SONGS
  end

  def song_params
    params.require(:song).permit(:artist, :title)
  end

end
