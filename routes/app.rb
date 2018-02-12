require 'sinatra/base'

class BooksInReview < Sinatra::Base
	set :views, File.expand_path('../../views', __FILE__)
	set :public_folder, File.expand_path('../../public', __FILE__)

	get '/' do
		erb :helloworld
	end
end