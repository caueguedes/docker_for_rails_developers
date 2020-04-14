class ApplicationController < ActionController::Base
	def home
		render plain: "<h1> Hello world </h1>"
	end
end
