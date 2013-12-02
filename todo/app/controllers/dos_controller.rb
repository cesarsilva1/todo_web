class DosController < ApplicationController
	include DosHelper

	def index
		@dos = Do.all
	end

	def show
		@do = Do.find(params[:id]) 
	end

	def new
		@do = Do.new
	end

	def create 
		@do = Do.new(do_params)
		@do.list_id = params[:list_id]
		@do.save
		flash.notice = "Do Created!"
		redirect_to dos_path(@do)
	end

end
