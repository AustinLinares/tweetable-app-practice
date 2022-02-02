class LikedTweetsController < ApplicationController
  before_action :set_liked_tweet, only: %i[ show edit update destroy ]

  # GET /liked_tweets
  def index
    @liked_tweets = LikedTweet.all
  end

  # GET /liked_tweets/1
  def show
  end

  # GET /liked_tweets/new
  def new
    @liked_tweet = LikedTweet.new
  end

  # GET /liked_tweets/1/edit
  def edit
  end

  # POST /liked_tweets
  def create
    @liked_tweet = LikedTweet.new(liked_tweet_params)

    if @liked_tweet.save
      redirect_to @liked_tweet, notice: "Liked tweet was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /liked_tweets/1
  def update
    if @liked_tweet.update(liked_tweet_params)
      redirect_to @liked_tweet, notice: "Liked tweet was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /liked_tweets/1
  def destroy
    @liked_tweet.destroy
    redirect_to liked_tweets_url, notice: "Liked tweet was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_liked_tweet
      @liked_tweet = LikedTweet.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def liked_tweet_params
      params.require(:liked_tweet).permit(:user_id, :tweet_id, :liked)
    end
end
