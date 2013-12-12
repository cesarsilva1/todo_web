class DosController < ApplicationController
	include DosHelper
	before_filter :require_login

	def index
		@dos = Do.all
	end

	def show
		@do = Do.find(params[:id]) 
	end

	def edit
		@do= Do.find(params[:id])
	end

	def update
		@do= Do.find(params[:id])
		@cord = @do.map
		if(!@cord["http"])
			@url = "http://maps.googleapis.com/maps/api/staticmap?center="+@cord+"&size=640x640&scale=2&markers=color:blue%7Clabel:S%7C"+@cord+"&sensor=false"
			params[:do][:map] = @url
		end
		@do.update(do_params)
		flash.notice = "Do Updated!"
		redirect_to list_path(@do.list_id)
	end

	def new
		@do = Do.new
		flash[:list_id] = params[:list_id]
	end

	def create 
		@do = Do.new(do_params)
		@cord = @do.map
		@url = "http://maps.googleapis.com/maps/api/staticmap?center="+@cord+"&size=640x640&scale=2&markers=color:blue%7Clabel:S%7C"+@cord+"&sensor=false"
		@do.map = @url
		@do.list_id = flash[:list_id]
		@do.save
		flash.notice = "Do Created!"
		redirect_to list_path(@do.list_id)
	end

	def destroy
		@do = Do.destroy(params[:id])
		@do.destroy
		flash.notice = "Do Deleted!"
		redirect_to list_path(@do.list_id)
	end 
end
