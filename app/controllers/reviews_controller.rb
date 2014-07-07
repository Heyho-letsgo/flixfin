class ReviewsController < ApplicationController
  before_action :set_movie

  def index
    @reviews = @movie.reviews
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


  private

  def review_params
    params.require(:review).permit(:name, :stars, :comment)
  end

  def set_movie
    @movie = Movie.find(params[:movie_id])
  end


end
