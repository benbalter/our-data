class TagsController < ApplicationController

  def index
    render :json => Dataset.tag_counts_on(:tags).order( "count DESC" )
  end
  
  def show 
    render :json => Dataset.tagged_with( params[:id], :on => :tags )
  end
  
end
