class AgenciesController < ApplicationController

  def index
    render :json => Agency.all, :callback => params[:callback]
  end
  
  def show
    @agency = Agency.find_by_id(params[:id])
    if @agency
      render :json => @agency, :callback => params[:callback]
    else
      render :json => { :status => "Error", :message => "Could not find agency with id=#{params[:id]}."}, :status => 404, :callback => params[:callback]
    end
  end
  
end
