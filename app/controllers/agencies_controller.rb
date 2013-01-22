class AgenciesController < ApplicationController

  def index
    render :json => Agency.all
  end
  
  def show
    @agency = Agency.find_by_id(params[:id])
    if @agency
      render :json => @agency
    else
      render :json => { :status => "Error", :message => "Could not find agency with id=#{params[:id]}."}, :status => 404
    end
  end
  
end
