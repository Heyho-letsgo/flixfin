class MoviesController < ApplicationController
  def index
    @movies = Movie.released
  end

  def show
    @movie = Movie.find(params[:id])
    #@rewiew = @movie.reviews.new
    #@review = @movie
   # @review = Review.find_by(params[:id]) # => affiche les commentaires liés au film
   # @review = @movie.reviews.find(params[:id])
    @review=Review.new({:movie_id => @movie.id})
    @reviews = @movie.reviews
  end
  
  def edit
    #fail
    @movie = Movie.find(params[:id])

  end
  
  def update
    @movie = Movie.find(params[:id])
   if @movie.update(movie_params)
    redirect_to @movie, notice: "Movie successfully updated!"
   else
     render :edit
  end
end
  def new
    @movie = Movie.new
  end



  def create
    @movie = Movie.new(movie_params)
      if @movie.save
    redirect_to @movie, notice: "Movie successfully created!"
          else
      render action: :new
      end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to movies_url, danger: "I'm sorry, Dave, I'm afraid I can't do that!"

    # redirect_to movies_path, alert: "Movie successfully deleted!"
    end
  
private

  def movie_params
    params.require(:movie).permit(:title, :description, :rating, :released_on, :total_gross, :cast, :director, :duration, :image_file_name)
  end

end

