class ListsController < ApplicationController
	def index
		@user = current_user
		@lists = @user.lists
	end
end
