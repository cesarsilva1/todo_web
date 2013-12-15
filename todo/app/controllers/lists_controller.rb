class ListsController < ApplicationController
	include ListsHelper

	before_filter :require_login
	/before_action :list_owner, only: [:show,:edit,:update,:destroy]/

	/def list_owner
		@user = current_user.id
		@list = List.find(params[:id])
		if(!@list)
			redirect_to root_path
		end
		if(@user!=@list.user_id)
			redirect_to root_path
		end
	end/


	def index
		@user = current_user
		@lists = @user.lists
		@sharings = Sharing.where(user_id: @user.id)
		@lists_shared = Array.new
		@sharings.each do |s|
			@lists_shared << List.find(s.list_id)
		end
	end

	def show
		@user = current_user
		@lists = @user.lists
		@sharings = Sharing.where(user_id: @user.id)
		@lists_shared = Array.new
		@sharings.each do |s|
			@lists_shared << List.find(s.list_id)
		end
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

		if(list_params[:shared])
			@string_emails = params[:userstoshare]
			@array_emails = @string_emails.split(',').collect{|s| s.strip.downcase}
			@user_ids = Array.new
			@array_emails.each do |a|
				@tmp = User.find_by email: a
				if (@tmp)
					@user_ids << @tmp.id
				end
			end
		end

		@list.save

		@user_ids.each do |u|
			@x = Sharing.new()
			@x.user_id = u
			@x.list_id = @list.id
			@x.save
		end

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
