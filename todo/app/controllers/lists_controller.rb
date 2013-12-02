class ListsController < ApplicationController
	include ListsHelper

	before_filter :require_login
	before_action :list_owner, only: [:show,:edit,:update,:destroy]

	def list_owner
		@user = current_user.id
		@list = List.find(params[:id])
		if(@user!=@list.user_id)
			redirect_to lists_path
		end
	end

	def index
		@user = current_user
		@lists = @user.lists
	end

	def show
		@user = current_user
		@lists = @user.lists
		@list = List.find(params[:id])
		@dos = @list.dos 
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
