class Library
    attr_accessor :books, :books_checked_out

    def initialize
        @books = YAML.load_file('./lib/data.yml')

    end

    def checkout(title)
        @find_book = @books.find { |book| book[:title] == title }
        availablity = @find_book[:available]

        availablity ? book_is_available : 'The book is unavailable'
    end
    
    def book_is_available

        @books_checked_out = []

        @find_book[:available] = false
        @find_book[:return_date] = Date.today.next_month(1)
        @books_checked_out << @find_book[:title]
        'The book is yours'
    end

    def return_date?(title)
        find_books_return_date = @books.find { |book| book[:title] == title }
        return_date = find_books_return_date[:return_date]
    end

    def display_books
        display_books = []

        books.each do |book|
            display_books << book[:title] 
        end
        display_books
    end

    def search_books(search_string)
        found_books_with_title = []

        search_books_array = @books.select { |book| book[:title].include? search_string }
        search_books_array.each do |book| 
            found_books_with_title << book[:title]
        end
       
        found_books_with_title
    end


    
end