class FormatsController < ApplicationController

  def index
    render :json => Dataset.tag_counts_on(:formats).order( "count DESC" )
  end
  
  def show
    render :json => Dataset.tagged_with( params[:id], :on => :formats )
  end
  
end
