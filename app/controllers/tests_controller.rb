class TestsController < ApplicationController
	def new
		@action_name = action_name
		@cookies = cookies
		@headers = headers
		@params = params
		@request = request
	end
end
