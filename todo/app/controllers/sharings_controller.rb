class SharingsController < ApplicationController

	def new
		@sharing = Sharing.new
	end

end
