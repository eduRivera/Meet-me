module VisitsHelper

	def flash_messages
		if flash[:notice]
			flash[:notice] 
		end 
	end
end
