class BookmarksController < ApplicationController
  before_action :set_list, only: [:new, :create]



  def new
    @bookmark = Bookmark.new
  end

  def create
        # récupérer les 3 champs
     # List (déjà dans le befor_action)

    # Comment
    @comment = params[:bookmark][:comment]

    # Movie
    @movie = Movie.find(params[:bookmark][:movie])

    # créer bookmark (concaténation)
    @bookmark = Bookmark.new({comment: @comment, movie: @movie, list: @list})
    # sauvegarder en bdd
    @bookmark.save
    redirect_to list_path(@list)

    # puts "coucou"
    # else
    #   render :new
    # end

      # on rend la vue du controller dans lequel on est déjà


      #show
    # @tags.each do |tag|
    #   plant_tag = PlantTag.new(plant: @plant, tag: tag)
    #   plant_tag.save
    # end
    # redirect_to garden_path(@plant.garden)
    # retoourner sur la vue de la list
  end

  def destroy
  end


  private

  def set_list
    @list = List.find(params[:list_id])
  end

end

# comment
# movie_id
# list_id
