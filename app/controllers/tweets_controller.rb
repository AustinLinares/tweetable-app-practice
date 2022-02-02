class TweetsController < ApplicationController
  before_action :set_tweet, only: %i[show edit update destroy]
  before_action :authenticate_user!, except: %i[index show]
  # GET /tweets
  def index
    @tweets = Tweet.all
  end

  # GET /tweets/1
  def show; end

  # GET /tweets/new
  def new
    @tweet = Tweet.new
    @parent_tweet = Tweet.find(params['tweet_id']) if params['tweet_id']
  end

  # GET /tweets/1/edit
  def edit; end

  # POST /tweets
  def create
    @tweet = Tweet.new(tweet_params)
    p '####################################'
    p params
    p tweet_params
    p '####################################'
    @tweet.parent_id = params['tweet_id'] if params['tweet_id']

    @tweet.user = current_user

    if @tweet.save
      redirect_to root_path, notice: 'Tweet was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tweets/1
  def update
    if @tweet.update(tweet_params)
      redirect_to @tweet, notice: 'Tweet was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /tweets/1
  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy
    p '######################################'
    redirect_to tweets_path
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_tweet
    @tweet = Tweet.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def tweet_params
    params.require(:tweet).permit(:body)
  end
end
