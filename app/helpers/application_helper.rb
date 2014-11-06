module ApplicationHelper

	def flash_class(type)
		case type
		when 'alert'
			"failure-notice"
		when 'notice'
			"notice"
		else
			""
		end
	end

end
