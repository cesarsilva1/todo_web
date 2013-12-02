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

	def new
		@do = Do.new
		flash[:list_id] = params[:list_id]
	end

	def create 
		@do = Do.new(do_params)
		@do.list_id = flash[:list_id]
		@do.save
		flash.notice = "Do Created!"
		redirect_to list_path(@do.list_id)
	end

end
