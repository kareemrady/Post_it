module ApplicationHelper
	def date_time(dt)
		dt.strftime("%a,%e %b %Y %H:%m:%S %p %Z")
	end

	def url_fixer(url)
		url.starts_with?("http://") ? url : "http://#{url}"
	end
end