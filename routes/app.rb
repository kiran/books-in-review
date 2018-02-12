require 'sinatra/base'
require 'sinatra/content_for'

require_relative '../lib/parse_csv_books'

class BooksInReview < Sinatra::Base
    set :views, File.expand_path('../../views', __FILE__)
    set :public_folder, File.expand_path('../../public', __FILE__)

    helpers Sinatra::ContentFor

    get '/' do
        erb :index
    end

    get '/gather_books' do
        erb :placeholder
    end

    get '/gather_kirans_books' do
        @books = CSVBooks.parse_books(File.expand_path("../../lib/goodreads-kiran-2016.csv", __FILE__))
        @total_length = @books.length
        erb :books_list
    end
end