module ListsHelper
	def list_params
    	params.require(:list).permit(:name, :color, :shared)
  	end
end
