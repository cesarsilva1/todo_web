class DosController < ApplicationController

	def index
	end

	def show
		@dos = Do.find(params[:id]) 
	end
end
