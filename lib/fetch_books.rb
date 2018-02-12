require 'goodreads'
require 'dotenv'
Dotenv.load

class GoodreadsBooks
	def initialize(key)
		@client = Goodreads::Client.new(api_key: key)
	end

	def fetch_books
		search = @client.shelf(15907485, 'read', {read_at: 2017})
		reviews = []

		# todo: how to paginate?
		search["books"].each do |gr_review|
			review = Review.hydrate_review(gr_review)
			# eventually store this in a database?
		end
	end

	# todo -- error handling for missing keys
	# use `.fetch` more than [] indexing
	def hydrate_review(gr_review)
		id = gr_review["id"]
		rating = gr_review["rating"]
		review_text = gr_review["body"]

		# get book information
		book_id = gr_review["book"]["id"]
		book_title = gr_review["book"]["title_without_series"]
		book = @client.book(book_id)
		# search for shelves for genre

		# BUG (2018-02-11, kiran) -- making the assumption that there's only one author
		author_id = gr_review["book"]["authors"].first["id"]
		author = @client.author(author_id)

	end
end

if __FILE__ == $0
	client = GoodreadsBooks.new(ENV["GOODREADS_API_KEY"])
	client.fetch_books
end