class DatasetsController < ApplicationController

  def index
    
    conditions = {}
    ["agency_id", "public"].each do |param|
      conditions[ param.to_sym ] = params[ param ] unless params[param].nil?
    end
  
    d = Dataset
    ["tags", "formats"].each do |tag|
      d = d.tagged_with( params[ tag ], :as => tag.to_sym ) unless params[tag].nil?
    end
    
    render :json => d.where(conditions)
    
  end
  
  def show
    @dataset = Dataset.find_by_id(params[:id])
    if @dataset
      render :json => @dataset
    else
      render :json => { :status => "Error", :message => "Could not find dataset with id=#{params[:id]}."}, :status => 404
    end
  end

end
