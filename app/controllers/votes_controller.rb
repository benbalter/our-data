class VotesController < ApplicationController
  before_filter :set_user
  after_filter :cache_score

  def upvote
    @dataset = Dataset.find_by_id(params[:id])
    @user.unvote_for @dataset
    @user.vote_for @dataset
    render :json => @dataset.plusminus.to_json
  end

  def downvote
    @dataset = Dataset.find_by_id(params[:id])
    @user.unvote_for @dataset
    @user.vote_against @dataset
    render :json => @dataset.plusminus.to_json
  end

  def cache_score
    @dataset = Dataset.find_by_id(params[:id])
    @dataset.score = @dataset.plusminus
    @dataset.save
  end

  def set_user
    @user = User.find_or_create_by_ip request.remote_ip
  end

end
