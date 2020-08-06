class Members::DestinationsController < ApplicationController
  def index
  	@dest_new = Destination.new
  	@dests = Destination.all
  end

  def create
  	@dest_new = Destination.new(dest_params)
  	if @dest_new.save
	  	redirect_to members_destinations_path
		else
			render :index
		end
  end

  def edit
  	@dest = Destination.find(params[:id])
  end

  def update
  	@dest = Destination.find(params[:id])
  	if @dest.update(dest_params)
  		redirect_to members_destinations_path
  	else
  		render :edit
  	end
  end

  def destroy
		dest = Destination.find(params[:id])
    dest.destroy
    redirect_to members_destinations_path
  end

  private
  def dest_params
		params.require(:destination).permit(:id, :post_address, :address, :full_name)
  end
end
