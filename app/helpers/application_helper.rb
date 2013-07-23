module ApplicationHelper
	def date_time(dt)
		dt.strftime("%a,%e %b %Y %H:%m:%S %p %Z")
	end

	def url_fixer(url)
		url.starts_with?("http://") ? url : "http://#{url}"
	end

	def listed_based_on_votes(post)
		a = []
		post.each do |post|
			a << {:votes => post.total_votes, :id => post.id}
		end
		b = a.sort_by {|h| -h[:votes]}
		b.each do |post|
			p = Post.find(post[:id])
		end

	end
end