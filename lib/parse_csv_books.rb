require 'csv'
require 'erb'
require 'open-uri'

module CSVBooks
  class Book
    attr_reader :title, :isbn, :rating, :review, :author, :tags
    def initialize(row)
      @title = row["Title"]
      @isbn = row["ISBN13"]
      @rating = row["My Rating"].to_i
      @review = row["Blurb"]
      @author = row["Author"]
      @tags = row['tags'].nil? ? [] : row['tags'].split(',')
    end

    def render(renderer)
      renderer.result(binding)
    end
  end

  module_function

  def parse_books(input_csv_path)
    books = []
    CSV.foreach(input_csv_path, {headers: :first_row}) do |row|
      books << Book.new(row)
    end
    books
  end
end