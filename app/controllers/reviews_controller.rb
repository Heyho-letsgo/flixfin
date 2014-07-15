class ReviewsController < ApplicationController
  before_action :set_movie

  def index
    @reviews = @movie.reviews.order(id: :desc)
      end

  def new # On crée l'URL /movies/:movie_id/reviews/new
    @review = @movie.reviews.new
    # par defaut, Rails se dirige vers /views/reviews.new.html.erb

  end


  def create
    @review = @movie.reviews.new(review_params)
    if @review.save
      redirect_to movie_reviews_path(@movie), notice: "Thanks for your commentaires!"
    else
      render :new
    end
  end

  def destroy
    @review = @movie.reviews.find(params[:id])
    @review.destroy
    redirect_to movie_reviews_path(@movie), notice: "Review successfully deleted!"

    #danger: "I'm sorry, Dave, I'm afraid I can't do that!"
    # redirect_to movies_path, alert: "Movie successfully deleted!"
  end



  private

  def review_params
    params.require(:review).permit(:name, :stars, :comment)
  end

  def set_movie
    @movie = Movie.find(params[:movie_id])
  end


end
