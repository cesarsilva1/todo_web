class ListsController < ApplicationController
	include ListsHelper

	before_filter :require_login

	def index
		@user = current_user
		@lists = @user.lists
	end

	def show
		@list = List.find(params[:id]) 
	end

	def edit
		@list= List.find(params[:id])
	end

	def update
		@list = List.find(params[:id])
		@list.update(list_params)
		flash.notice = "List '#{@list.name}' Updated!"
		redirect_to list_path()
	end

	def new
		@list = List.new
	end

	def create
		@list = List.new(list_params)
		@list.user_id = current_user.id
		@list.save
		flash.notice = "List '#{@list.name}' Created!"
		redirect_to list_path(@list)
	end

	def destroy
		@list = List.destroy(params[:id])
		@list.destroy
		flash.notice = "List '#{@list.name}' Deleted!"
		redirect_to list_path
	end 
end
