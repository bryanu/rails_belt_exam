class ListsController < ApplicationController

  def show
    @user     = User.find(params[:id])
    @songs    = List.where(user: @user)
    @currUser = currUser
  end

  def add
    song = Song.find(params[:id])

    #objAdd   = List.find_by(user: currUser, song: song)  #exist??
    #puts "\n\n\n\n objAdd = #{objAdd.inspect} \n\n\n\n"
    #if objAdd
    # if objAdd  = List.find_by(user: currUser, song: song) #exist??
    #   currCount = List.find_by(user: currUser, song: song).count
    #   tList = List.find_by(user: currUser, song: song)
    #   tList.update(count: currCount+1)
    # else
    #   List.create(user: currUser, song: song, count: 1)
    # end

    if objAdd = List.find_by(user: currUser, song: song) #exist??
      currCount = List.find_by(user: currUser, song: song).count
      List.find_by(user: currUser, song: song).update(count: currCount+1)
    else
      List.create(user: currUser, song: song, count: 1)
    end

    redirect_to URL_SONGS

  end

end
