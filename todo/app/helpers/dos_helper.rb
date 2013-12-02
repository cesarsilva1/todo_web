module DosHelper
	def do_params
    	params.require(:do).permit(:completed, :priority, :details, :map, :date)
  	end
end
